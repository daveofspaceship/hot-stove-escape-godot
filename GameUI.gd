extends CanvasLayer

@onready var message_label = $MessageLabel
@onready var score_label = $ScoreLabel

func show_message(text):
	message_label.text = text
	message_label.show()

func update_status(text):
	score_label.text = text

func hide_message():
	message_label.hide()

func show_game_over():
	show_message("You're Toast!\nPress R to Restart")

func show_win():
	show_message("Safe at Last!\nPress R to Play Again")
