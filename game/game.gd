extends Node2D

var game_state: int
var hits_left: int
var bag_slot: int
var player_slot: int
var lives: int
const HITS_NEEDED: int = 50; 

var bags_next_pos: int

const slots: Array[int] = [
	14,
	34,
	54,
	74,
	94,
	114,
	134
]

func _ready():
	switch_screen(0)
	update_hud()
	$PlayScreen/marker.play("default")


func _process(delta):
	update_player()
	update_bag()


func update_bag():
	$PlayScreen/marker.position = Vector2(slots[bags_next_pos], 85)
	if bag_slot < player_slot:
		$PlayScreen/PunchingBag.scale.x = 1
	elif bag_slot > player_slot:
		$PlayScreen/PunchingBag.scale.x = -1
	$PlayScreen/PunchingBag.position = Vector2(slots[bag_slot], 85)


func update_player():
	if bag_slot < player_slot:
		$PlayScreen/Player.scale.x = 1
	elif bag_slot > player_slot:
		$PlayScreen/Player.scale.x = -1
	$PlayScreen/Player.position = Vector2(slots[player_slot], 88)

func update_hud():
	$PlayScreen/lblHits.text = str(hits_left)

func switch_screen(new_screen: int):
	self.game_state = new_screen
	match new_screen:
		0:
			$PlayScreen.hide()
			$GameOver.hide()
			$StartScreen.show() 
		1:
			bags_next_pos = 3
			lives = 3
			hits_left = HITS_NEEDED
			bag_slot = 0
			player_slot = 1
			update_hud()
			$PlayScreen.show()
			$StartScreen.hide()
			$GameOver.hide()
			$PlayScreen/TimeLeft.start();
		2:
			$PlayScreen.hide()
			$StartScreen.hide()
			$GameOver.show()


func player_punch():
	if player_slot == (bag_slot - 1) or player_slot == bag_slot + 1:
		$PlayScreen/Player.play("punch")
		$PlayScreen/PunchingBag.play("hit")
		hits_left -= 1
		update_hud()
		move_bag()
	else:
		print("Miss punch. Game Over")
		gameover()


func move_bag():
	bag_slot = bags_next_pos
	var new_pos = randi_range(0,6)
	while new_pos == bags_next_pos or new_pos == clamp(bags_next_pos - 1, 0, 6) or new_pos == clamp(bags_next_pos + 1, 0, 5):
		new_pos = randi_range(0,6)
	
	bags_next_pos = new_pos


func get_new_pos(slot: int) -> Vector2:
	return Vector2(100,100)


func _input(event):
	match game_state:
		0:
			if event.is_action_pressed("move") or event.is_action_pressed("poke"):
				self.switch_screen(1)
		1:
			if event.is_action_pressed("poke"):
				player_punch()
			if event.is_action_pressed("move"):
				move_player()
		2: 
			if event.is_action_pressed("move") or event.is_action_pressed("poke"):
				self.switch_screen(1)
	
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()


func gameover() -> void:
	self.switch_screen(2)

func  move_player():
	if $PlayScreen/Player.scale.x == 1 and player_slot != (bag_slot + 1):
		player_slot -= 1
	elif $PlayScreen/Player.scale.x == -1 and player_slot != (bag_slot - 1):
		player_slot += 1
	else:
		print("Miss movement. Game Over")
		gameover()
	
	
