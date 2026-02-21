extends AnimatableBody2D

@export var travel_distance = Vector2(200, 0)
@export var duration = 2.0

func _ready():
	start_tween()

func start_tween():
	# Create a tween to handle the movement
	var tween = create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	# Set the tween to loop indefinitely
	tween.set_loops()
	
	# Move the platform to the target position and back
	tween.tween_property(self, "position", position + travel_distance, duration)
	tween.tween_property(self, "position", position, duration)
