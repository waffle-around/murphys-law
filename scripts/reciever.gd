extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var player = get_node("Player2")
	player.action_pressed.connect(_on_player_action_pressed)

func _on_player_action_pressed(strength: float) -> void:
	print("misfortune occuring, strength: ", strength)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
