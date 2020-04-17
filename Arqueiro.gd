extends KinematicBody2D
var motion = Vector2()
const UP = Vector2(0, -1)
const GRAVITY =20
const SPEED = 200
const VECTOR = Vector2(100, 0)
const JUMP_HEIGHT = -550
var distance_from_me = 100 
const FLECHA = preload("res://Flecha.tscn")
var score;

var x = 0
var y = 0
var quantidade = 10

var timer = null
var shoot_delay = 1
var can_shoot = true

func _ready():
	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(shoot_delay)
	timer.connect("timeout", self, "on_timeout_complete")
	add_child(timer)
	

func on_timeout_complete():
	can_shoot = true
func _physics_process(delta):
	get_parent().get_node("Label").text = (str("Você possui: ", quantidade, " tiros "))
	get_parent().get_node("Label2").text = (str("Score: ", global.score))
	if Input.is_action_pressed("ui_up"):
		motion.y = -SPEED
	elif Input.is_action_pressed("ui_down"):
			motion.y = SPEED
	elif Input.is_action_pressed("ui_right") && can_shoot:
		if(quantidade > 0):
			shooting()
			quantidade = quantidade - 1
			can_shoot = false
			timer.start()
		else:
			print("sem balas")
		
	else:
		motion.y = 0
	if(global.score > 300):
		print("Passou de fase")
	move_and_slide(motion, UP)


func shooting():
	var bullet = FLECHA.instance() 
	bullet.position = $Position2D.global_position
	get_parent().add_child(bullet)
	
	
	

