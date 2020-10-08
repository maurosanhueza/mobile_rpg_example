extends Node
class_name PlayerStats

const BattleUnits = preload("res://BattleUnits.tres")

const MAX_HP = 25
const MAX_AP = 3
const MAX_MP = 10

var hp = MAX_HP setget set_hp
var ap = MAX_AP setget set_ap
var mp = MAX_MP setget set_mp

signal hp_changed(value)
signal ap_changed(value)
signal mp_changed(value)

signal end_turn

func set_hp(hp_value):
	hp = clamp(hp_value,0, MAX_HP)
	emit_signal("hp_changed",hp)
	
func set_ap(ap_value):
	ap = clamp(ap_value,0, MAX_AP)
	emit_signal("ap_changed",ap)
	if ap == 0:
		emit_signal("end_turn")
	
func set_mp(mp_value):
	mp = clamp(mp_value,0, MAX_MP)
	emit_signal("mp_changed",mp)	
	
func ready():
	BattleUnits.Player = self
	
func _exit_tree():
	BattleUnits.Player = null	

