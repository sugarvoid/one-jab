extends Node2D

@onready var player: AnimatedSprite2D = get_node("PlayScreen/Player")
@onready var punching_bag: AnimatedSprite2D = get_node("PlayScreen/PunchingBag")
@onready var marker: AnimatedSprite2D = get_node("PlayScreen/marker")
@onready var lbl_hits_left: Label = get_node("PlayScreen/lblHits")
@onready var lbl_time: Label = get_node("PlayScreen/LblTime")

const HITS_NEEDED: int = 20
const slots: Array[int] = [
	14,
	34,
	54,
	74,
	94,
	114,
	134
]

var game_state: int
var hits_left: int
var bag_slot: int
var player_slot: int
var lives: int
var bags_next_pos: int
var misses: int


func _ready():
	switch_screen(0)
	update_hud()
	marker.play("default")


func _process(_delta: float):
	lbl_time.text = $PlayScreen/Stopwatch.get_time()
	update_player()
	update_bag()


func update_bag():
	marker.position = Vector2(slots[bags_next_pos], 85)
	if bag_slot < player_slot:
		punching_bag.scale.x = 1
	elif bag_slot > player_slot:
		punching_bag.scale.x = -1
	punching_bag.position = Vector2(slots[bag_slot], 85)


func update_player():
	if bag_slot < player_slot:
		player.scale.x = 1
	elif bag_slot > player_slot:
		player.scale.x = -1
	player.position = Vector2(slots[player_slot], 88)


func update_hud():
	lbl_hits_left.text = str(hits_left)
	

func switch_screen(new_screen: int):
	self.game_state = new_screen
	$PlayScreen/Stopwatch.stop()
	match new_screen:
		0:
			$PlayScreen.hide()
			$GameOver.hide()
			$StartScreen.show() 
		1:
			$PlayScreen/Stopwatch.start()
			bags_next_pos = randi_range(2,6)
			lives = 3
			hits_left = HITS_NEEDED
			bag_slot = 0
			player_slot = 1
			misses = 0
			update_hud()
			$PlayScreen.show()
			$StartScreen.hide()
			$GameOver.hide()
		2:
			$PlayScreen.hide()
			$StartScreen.hide()
			$GameOver.show()


func player_punch():
	if player_slot == (bag_slot - 1) or player_slot == bag_slot + 1:
		player.play("punch")
		punching_bag.play("hit")
		hits_left -= 1
		update_hud()
		move_bag()
	else:
		print("Miss punch. Game Over")
		set_gameoever_text("You should have moved...")
		gameover()
	if hits_left == 0:
		set_gameoever_text(str("you win\n",$PlayScreen/Stopwatch.get_time()))
		$PlayScreen/Stopwatch.stop()
		gameover()


func move_bag():
	bag_slot = bags_next_pos
	var new_pos = randi_range(0,6)
	while new_pos == bags_next_pos or new_pos == clamp(bags_next_pos - 1, 0, 6) or new_pos == clamp(bags_next_pos + 1, 0, 5):
		new_pos = randi_range(0,6)
	
	bags_next_pos = new_pos


func _input(event):
	match game_state:
		0:
			if event.is_action_pressed("move") or event.is_action_pressed("poke"):
				self.switch_screen(1)
			if event.is_action_pressed("ui_cancel"):
				get_tree().quit()
		1:
			if event.is_action_pressed("poke"):
				player_punch()
			if event.is_action_pressed("move"):
				move_player()
			if event.is_action_pressed("ui_cancel"):
				switch_screen(0)
		2: 
			if event.is_action_pressed("move") or event.is_action_pressed("poke"):
				self.switch_screen(1)



func gameover() -> void:
	$PlayScreen/Stopwatch.stop()
	self.switch_screen(2)

func set_gameoever_text(text: String):
	$GameOver/LblMessage.text = text

func  move_player():
	if $PlayScreen/Player.scale.x == 1 and player_slot != (bag_slot + 1):
		player_slot -= 1
	elif $PlayScreen/Player.scale.x == -1 and player_slot != (bag_slot - 1):
		player_slot += 1
	else:
		print("Miss movement. Game Over")
		set_gameoever_text("You should have punched...")
		gameover()
	
	
