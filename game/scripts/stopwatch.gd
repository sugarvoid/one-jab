extends Node

var running: bool = false
var start_time: int = 0
var elapsed: int


func _ready():
	start()


func _process(_delta: float) -> void:
	if running:
		get_time()


func start() -> void:
	running = true
	elapsed = 0
	start_time = Time.get_ticks_msec()

func get_time_int() -> int:
	return elapsed

func get_time() -> String:
	elapsed = (Time.get_ticks_msec() - start_time)
	
	var minutes = elapsed / 60 / 1000
	var seconds = elapsed / 1000 % 60
	var miliseconds = elapsed / 10 % 100
	
	var time_string: String = "%02d:%02d:%02d" % [minutes, seconds, miliseconds]
	return time_string
	
func stop() -> void:
	running = false

