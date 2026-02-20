extends Area2D

signal player_won

func _on_body_entered(body):
	if body.is_in_group("player"):
		player_won.emit()
