extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var player = get_node("../Player")
	player.action_pressed.connect(_on_player_action_pressed)

func _on_player_action_pressed(strength: float) -> void:
	# Check if the player is currently inside this Area2D
	var player = get_node("../Player")
	if overlaps_body(player):
		print("misfortune occuring, strength: ", strength)
