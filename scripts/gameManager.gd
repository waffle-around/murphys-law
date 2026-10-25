extends Node

var counter: int = 0
var health: int = 3

@onready var ui = $UI
@export var audio_stream_player_2d: AudioStreamPlayer2D

func _cause_misfortune():
	counter += 1
	ui._update_score_label(counter)
	if counter == 10:
		get_tree().call_deferred("reload_current_scene")

func _take_damage():
	health -= 1
	ui._update_health_label(health)
	if health == 0:
		get_tree().call_deferred("reload_current_scene")

func _ready() -> void:
	audio_stream_player_2d.play()
