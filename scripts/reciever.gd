extends Area2D

@export var replacement_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var player = get_node("../Player")
	player.action_pressed.connect(_on_player_action_pressed)

func _on_player_action_pressed(strength: float) -> void:
	# Check if the player is currently inside this Area2D
	var player = get_node("../Player")
	if overlaps_body(player):
		get_parent()._cause_misfortune()
		
		if replacement_scene:
			var new_object = replacement_scene.instantiate()
			new_object.global_position = global_position
			get_parent().add_child(new_object)
			
		queue_free()
