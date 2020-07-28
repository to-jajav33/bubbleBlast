extends AnimatedSprite

export var animationFPS = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Input.is_action_pressed("left")):
		get_node(".").play("walk_left")
	elif (Input.is_action_pressed("right")):
		get_node(".").play("walk_right")
	elif (Input.is_action_pressed("up")):
		get_node(".").play("walk_up")
	elif (Input.is_action_pressed("down")):
		get_node(".").play("walk_down")
	else:
		get_node(".").stop()
	frames.set_animation_speed(animation, animationFPS)
	pass
