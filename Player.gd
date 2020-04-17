extends KinematicBody2D
var motion = Vector2()
const UP = Vector2(0, -1)
const GRAVITY =- 1
const SPEED = 200
const JUMP_HEIGHT = -550
var number = 0
var local = 0
var posicao_inicial

func _ready():
	local = randi()%1+1
	posicao_inicial = $".".position.y
	

func _physics_process(delta):
	rodar()

	move_and_slide(motion, UP)


func rodar():
	number = randi()%1+1
	motion.y += -0.4
	


func _on_Area2D_body_entered(body):
	print("saiu")

