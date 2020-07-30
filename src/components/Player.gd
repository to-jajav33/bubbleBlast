extends AnimatedSprite

export var animationFPS = 5
export var speed = 100
var oldDir = Vector2.LEFT
var isFinished = true

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	pass # Replace with function body.
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var dir = Vector2.ZERO
	var isAttacking = (Input.is_action_just_pressed("attack")) || ((isFinished == false) && (animation == "attack_right" || animation == "attack_left"))
	
	if (Input.is_action_just_pressed("attack")):
		isFinished = false
		if (oldDir == Vector2.LEFT):
			play("attack_left")
		elif (oldDir == Vector2.RIGHT):
			play("attack_right")
	
	if (isAttacking == false):
		if (Input.is_action_pressed("left")):
			dir += Vector2.LEFT
	
		if (Input.is_action_pressed("right")):
			dir += Vector2.RIGHT
		
		if (dir == Vector2.LEFT):
			play("walk_left")
			oldDir = dir
		elif (dir == Vector2.RIGHT):
			play("walk_right")
			oldDir = dir
		else:
			stop()
			frame = 0
	
		position = position + (dir * speed * delta)

	
	frames.set_animation_speed(animation, animationFPS)
	pass


func _on_Player_animation_finished():
	isFinished = true
	frame = 0
	stop()
	pass # Replace with function body.
