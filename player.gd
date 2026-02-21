extends CharacterBody2D

signal died

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	motion_mode = MOTION_MODE_GROUNDED
	if has_node("Sprite2D"):
		$Sprite2D.visible = true

var jumps_remaining = 2

func _physics_process(delta):
	# Add the gravity.
	velocity.y += gravity * delta

	# Reset jumps when on floor
	if is_on_floor():
		jumps_remaining = 2

	# Handle jump.
	if Input.is_action_just_pressed("jump") and jumps_remaining > 0:
		velocity.y = JUMP_VELOCITY
		jumps_remaining -= 1

	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("move_left", "move_right")

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func die():
	died.emit()
	queue_free()
