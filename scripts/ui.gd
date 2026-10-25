extends CanvasLayer

@onready var score_label = $HUD/MarginContainer/score
@onready var health_label = $HUD/MarginContainer/health

func _update_score_label(newScore: int) -> void:
	score_label.text = "Misfortune caused: " + str(newScore) + "/10"

func _update_health_label(newHealth: int) -> void:
	health_label.text = "Health: " + str(newHealth) + "/3"
