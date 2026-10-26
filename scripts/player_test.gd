extends CharacterBody2D


const SPEED = 500.0 ## movement speed
const JUMP_VELOCITY = -750.0 ## jump height
signal action_pressed(strength: float)
@onready var anim = $AnimatedSprite2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

#handles misfortune aura mechanic
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Activate Aura"): ## bound to x
		action_pressed.emit(1.0) ## aura strength (not sure if we're gonna use this)
		audio_stream_player_2d.play()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		anim.play("default")
		if direction > 0:
			$AnimatedSprite2D.flip_h = false  # Facing right
		elif direction < 0:
			$AnimatedSprite2D.flip_h = true   # Facing left (flipped)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		anim.play("idle")
	move_and_slide()
