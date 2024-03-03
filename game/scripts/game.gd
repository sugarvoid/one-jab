extends Node2D

@onready var player: AnimatedSprite2D = get_node("PlayScreen/Player")
@onready var punching_bag: AnimatedSprite2D = get_node("PlayScreen/PunchingBag")
@onready var marker: AnimatedSprite2D = get_node("PlayScreen/marker")
@onready var lbl_hits_left: Label = get_node("PlayScreen/lblHits")
@onready var lbl_time: Label = get_node("PlayScreen/LblTime")
@onready var stopwatch: Node = get_node("PlayScreen/Stopwatch")


const GAME_HISTORY_PATH = "user://game_history.json"
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
var _game_history: Array

var game_data: Dictionary = {
	"date": null,
	"name": "",
	"time": "",
	"time_int": 0
}


func _ready():
	switch_screen(0)
	update_hud()
	marker.play("default")
	make_save_file()


func _process(_delta: float):
	lbl_time.text = stopwatch.get_time()
	update_player()
	update_bag()


func update_bag() -> void:
	marker.position = Vector2(slots[bags_next_pos], 85)
	if bag_slot < player_slot:
		punching_bag.scale.x = 1
	elif bag_slot > player_slot:
		punching_bag.scale.x = -1
	punching_bag.position = Vector2(slots[bag_slot], 85)


func update_player() -> void:
	if bag_slot < player_slot:
		player.scale.x = 1
	elif bag_slot > player_slot:
		player.scale.x = -1
	player.position = Vector2(slots[player_slot], 88)


func update_hud() -> void:
	lbl_hits_left.text = str(hits_left)
	

func switch_screen(new_screen: int) -> void:
	self.game_state = new_screen
	var stating = get_starter_pos()
	stopwatch.stop()
	match new_screen:
		0:
			$PlayScreen.hide()
			$GameOver.hide()
			$StartScreen.show() 
		1:
			_game_history = load_history()
			$PlayScreen/LblTimeBest.text = get_best_time()
			stopwatch.start()
			bags_next_pos = stating.pop_front()
			lives = 3
			hits_left = HITS_NEEDED
			bag_slot = stating[0]
			player_slot = 3
			misses = 0
			update_hud()
			$PlayScreen.show()
			$StartScreen.hide()
			$GameOver.hide()
		2:
			$PlayScreen.hide()
			$StartScreen.hide()
			$GameOver.show()


func get_starter_pos() -> Array[int]:
	var arr: Array[int] = [randi_range(0,2), randi_range(4,6)]
	arr.shuffle()
	return arr

func player_punch() -> void:
	if player_slot == (bag_slot - 1) or player_slot == bag_slot + 1:
		player.play("punch")
		punching_bag.play("hit")
		hits_left -= 1
		update_hud()
		move_bag()
	else:
		print("Miss punch. Game Over")
		set_gameoever_text("wrong move")
		gameover()
	if hits_left == 0:
		var completion_time = stopwatch.get_time()
		set_gameoever_text(str("Time\n",completion_time))
		store_game_data(completion_time)
		# set_gameoever_text(str("Time\n",stopwatch.get_time(), "\n", "Misses: ", misses))
		stopwatch.stop()
		gameover()


func move_bag() -> void:
	bag_slot = bags_next_pos
	var new_pos = randi_range(0,6)
	while new_pos == bags_next_pos or new_pos == clamp(bags_next_pos - 1, 0, 6) or new_pos == clamp(bags_next_pos + 1, 0, 5):
		new_pos = randi_range(0,6)
	
	bags_next_pos = new_pos


func _input(event) -> void:
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
	stopwatch.stop()
	self.switch_screen(2)

func set_gameoever_text(text: String) -> void:
	$GameOver/LblTime.text = text

func  move_player() -> void:
	if player.scale.x == 1 and player_slot != (bag_slot + 1):
		player_slot -= 1
	elif player.scale.x == -1 and player_slot != (bag_slot - 1):
		player_slot += 1
	else:
		print("Miss movement. Game Over")
		set_gameoever_text("wrong move")
		gameover()
	
	
	
	
func store_game_data(round_time: String) -> void:
	
	var time: Dictionary = Time.get_datetime_dict_from_system()
	var display_string : String = "%d/%02d/%02d %02d:%02d" % [time.year, time.month, time.day, time.hour, time.minute]
	
	game_data.date = display_string
	game_data.time = round_time
	game_data.name = "_name_"
	game_data.time_int = stopwatch.get_time_int()
	
	_game_history.append(game_data)
	
	var file = FileAccess.open(GAME_HISTORY_PATH, FileAccess.READ_WRITE)
	var json_string = JSON.stringify(_game_history, "\t")
	
	file.store_string(json_string)
	file.close()

func sort_descending(a, b):
	if a.time_int < b.time_int:
		return true
	return false

func make_save_file():
	if FileAccess.file_exists(GAME_HISTORY_PATH):
		print('file is here')
	else:
		var file = FileAccess.open(GAME_HISTORY_PATH, FileAccess.WRITE)
		file.close()

func load_history() -> Array:
	var file = FileAccess.open(GAME_HISTORY_PATH, FileAccess.READ)
	var test: Array = []
	var content = file.get_as_text()
	print(str("contec:",content))
	file.close()
	if content != "":
		test = JSON.parse_string(content)
	return test

func get_best_time() -> String:
	var data: Array = _game_history
	if data != []:
		data.sort_custom(sort_descending)
		return data[0].time
	else:
		return "00:00:00"
