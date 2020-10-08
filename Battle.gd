extends Node
class_name Battle

onready var enemy = $Enemy
onready var playerStats = $PlayerStats
onready var battleActionsButtons = $UI/BattleActionsButtons

func _ready():
	start_player_turn()

func start_enemy_turn():
	print("start enemy turn")
	battleActionsButtons.hide()
	if enemy != null:
		enemy.attack(playerStats)
		yield(enemy, "end_turn")
	start_player_turn()	

func start_player_turn():
	print("start player turn")
	battleActionsButtons.show()
	playerStats.ap = playerStats.MAX_AP
	yield(playerStats, "end_turn")
	start_enemy_turn()
		
func _on_Enemy_died():
	battleActionsButtons.hide()
	enemy = null

