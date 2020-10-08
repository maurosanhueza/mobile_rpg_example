extends Node2D
class_name Enemy

const BattleUnits = preload("res://BattleUnits.tres")

var hp = 25 setget set_hp
var target = null

onready var hpLabel = $HPLabel
onready var animationPlayer = $AnimationPlayer

signal died
signal end_turn

func set_hp (new_hp):
	hp = new_hp
	hpLabel.text = str(hp) + "hp"
	
func ready():
	BattleUnits.Enemy = self	
	
func _exit_tree():
	BattleUnits.Enemy = null		

func attack(target)->void:
	yield(get_tree().create_timer(0.4), "timeout")
	animationPlayer.play("Attack")
	self.target = target
	yield(animationPlayer, "animation_finished")
	emit_signal("end_turn")

func deal_damage():
	self.target.hp -= 4
	print("DEAL DAMAGE!!!!!!!!!!!!!!")

func take_damage(ammount):
	self.hp -= ammount
	if is_dead():
		emit_signal("died")
		queue_free()
	else:
		animationPlayer.play("Shake")	

func is_dead():
	return hp <= 0
