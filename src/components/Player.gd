extends AnimatedSprite


# Declare member variables here. Examples:
export var animationFPS = 5.0;
export var speed = 100.0;
var oldDir = Vector2.LEFT;
var isFinished = true;

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true);
	pass; # Replace with function body.

func _process(delta):
	var dir = Vector2.ZERO;
	var isAttacking = (Input.is_action_just_pressed("attack")) || ((isFinished == false) && (animation == "attack_right" || animation == "attack_left"));
	
	if (Input.is_action_just_pressed("attack")):
		isFinished = false;
		if (oldDir == Vector2.LEFT):
			get_node(".").play("attack_left");
		elif (oldDir == Vector2.RIGHT):
			get_node(".").play("attack_right");
	
	if (isAttacking == false):
		if (Input.is_action_pressed("left")):
			dir += Vector2.LEFT;
		
		if (Input.is_action_pressed("right")):
			dir += Vector2.RIGHT;
		
		if (dir == Vector2.LEFT):
			get_node(".").play("walk_left");
			oldDir = dir;
		elif (dir == Vector2.RIGHT):
			get_node(".").play("walk_right");
			oldDir = dir;
		else:
			get_node(".").stop();
			get_node(".").frame = 0;
	
		position = position + (dir * speed * delta);
	
	frames.set_animation_speed(animation, animationFPS);
	pass;


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Player_animation_finished():
	isFinished = true;
	get_node(".").frame = 0;
	get_node(".").stop();
	pass # Replace with function body.
