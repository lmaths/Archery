extends KinematicBody2D
var velocity = Vector2(0,0)
var posicaox = 0;
var posicaoy = 0;
var score = 0;



# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _ready():
	velocity.x = 3.5
	velocity.y = posicaoy

func _physics_process(delta):
	move_and_collide(velocity)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


	
	


func _on_Area2D_body_entered(body):
	if(body.get_name() == "Player3" or body.get_name() == "Player" or body.get_name() == "Player2" or body.get_name() == "Player4"):
		global.score = global.score + 100
		$Label.text = str(global.score)
		body.queue_free()
		
	
	pass # Replace with function body.
