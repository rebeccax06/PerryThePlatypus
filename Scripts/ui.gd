extends CanvasLayer

class_name UI

@onready var center_container = $MarginContainer/CenterContainer

@onready var score_label = $MarginContainer/HBoxContainer/ScoreLabel
@onready var coins_label = $MarginContainer/HBoxContainer/CoinsLabel
@onready var next_level_timer = $NextLevelTimer 
func set_score(points: int):
	score_label.text = "SCORE: %d" % points

func set_coins(coins: int):
	coins_label.text = "COINS: %d" % coins
	
func on_finish():
	center_container.visible = true
	next_level_timer.start()  # Start the timer when "You Win" is displayed

func _on_Next_level_timer_timeout():
	print("Timer finished, switching to next level.")
	var level_manager = get_tree().get_first_node_in_group("level_manager")
	SceneData.coins = level_manager.coins
	SceneData.points = level_manager.points 
	get_tree().change_scene_to_file("res://Scenes/Level2.tscn")  # Change to the next level
