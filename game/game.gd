extends Node2D

var game_state: int
var hits: int
var bag_slot: int
var player_slot: int

const slots: Array[int] = [
	14,
	34,
	54,
	74,
	94,
	114
]

func _ready():
	switch_screen(0)
	update_hud()


func _process(delta):
	update_player()
	update_bag()


func update_bag():
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
	$PlayScreen/lblHits.text = str(hits)

func switch_screen(new_screen: int):
	self.game_state = new_screen
	match new_screen:
		0:
			$PlayScreen.hide()
			$GameOver.hide()
			$StartScreen.show() 
		1:
			hits = 0
			bag_slot = 0
			player_slot = 1
			$PlayScreen.show()
			$StartScreen.hide()
		2:
			$PlayScreen.hide()


func player_punch():
	if player_slot == (bag_slot - 1) or player_slot == bag_slot + 1:
		$PlayScreen/PunchingBag/AnimatedSprite2D.play("hit")
		hits += 1
		update_hud()
		move_bag()
	else:
		print("Miss punch. Game Over")


func move_bag():
	var new_pos = randi_range(0,5)
	while new_pos == player_slot:
		new_pos = randi_range(0,5)
	bag_slot = new_pos


func get_new_pos(slot: int) -> Vector2:
	return Vector2(100,100)


func _input(event):
	match game_state:
		0:
			if event.is_action_pressed("move") or event.is_action_pressed("poke"):
				self.switch_screen(1)
		1:
			if event.is_action_pressed("ui_accept"):
				$PlayScreen/PunchingBag/AnimatedSprite2D.play("hit")
			if event.is_action_pressed("poke"):
				player_punch()
			if event.is_action_pressed("move"):
				move_player()
		2: 
			pass
	
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()


func  move_player():
	if $PlayScreen/Player.scale.x == 1 and player_slot != (bag_slot + 1):
		player_slot -= 1
	elif $PlayScreen/Player.scale.x == -1 and player_slot != (bag_slot - 1):
		player_slot += 1
	else:
		print("Miss movement. Game Over")
	
	
