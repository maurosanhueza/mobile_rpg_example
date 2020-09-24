extends Node
class_name Battle

onready var enemy = $Enemy

func _on_SwordButton_pressed():
	print("attack")
	enemy.hp -= 4
