extends ColorRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	# print("it worked")
	var level1Instance = load("res://components/Level1.tscn").instance()
	get_parent().add_child(level1Instance);
	queue_free(); # this deletes scene
