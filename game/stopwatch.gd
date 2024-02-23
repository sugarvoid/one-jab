extends Node

var running = false
var start_time = 0



func _ready():
	start()
	
func _process(delta):
	if running:
		get_time()
		

func start():
	running = true
	start_time = Time.get_ticks_msec()
	

func get_time():
	var elapsed = (Time.get_ticks_msec() - start_time) #/ 1000.0
	##var elapsed = time_now - start_time
	
	var minutes = int(elapsed / 60 / 1000)
	var seconds = elapsed / 1000 % 60
	var miliseconds: int = elapsed / 10 % 100
	
	#var elapsed_time = "%02d:%02d:%02d" % [hours ,minutes, seconds]
	#var time = ("%02d" % minutes) + (":%02d" % seconds) + (":%02d" % miliseconds)
	var labelText = "%02d:%02d:%02d" % [minutes, seconds, miliseconds]
	return labelText
	
func stop():
	running = false

func _on_Button_pressed():
	if !running:
		start()	
	else:
		stop()



