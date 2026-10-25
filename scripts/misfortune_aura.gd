extends CharacterBody2D

signal action_pressed(strength: float)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Activate Aura"):
		action_pressed.emit(1.0)
		print ("emitting!")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
