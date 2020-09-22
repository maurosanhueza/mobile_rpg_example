extends Node
class_name Battle

onready var hpLabel = $Enemy/HPLabel

func _on_SwordButton_pressed():
	print("attack")
	hpLabel.text = "15hp"
