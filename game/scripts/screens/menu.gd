###
# This script is responsible for main game menu.
# Author: Breno Viana
# Version: 16/11/2017
###
extends Node2D

func _ready():
	""" Called every time the node is added to the scene.
		Initialization here. """
	get_node("intro_song").play("intro")
	var sample = get_node("intro_song").get_sample_library().get_sample("intro")
	sample.set_loop_format(1)
	sample.set_loop_begin(0)
	sample.set_loop_end(922752)
	set_process(true)

func _process(delta):
	""" Called every frame. Check the interactions with the menu. """
	# Start a new game
	if(get_node("panel/new_game").is_pressed()):
		reset_global_values()
		get_tree().change_scene("res://scenes/levels/w1l1.tscn")
	# Load saved game
	if(get_node("panel/load_game").is_pressed()):
		get_tree().change_scene("res://scenes/screens/load_game.tscn")
	# Instructions
	if(get_node("panel/instructions").is_pressed()):
		get_tree().change_scene("res://scenes/screens/instructions.tscn")
	# Credits
	if(get_node("panel/credits").is_pressed()):
		get_tree().change_scene("res://scenes/screens/credits.tscn")
	# Quit game
	if(get_node("panel/quit_game").is_pressed()):
		get_tree().quit()

func reset_global_values():
	# Game settings
	Globals.set("paused", false)
	Globals.set("current_level", "w1l1")
	# Enemies settings
	Globals.set("enemy_group", "enemies")
	# Player attributes
	Globals.set("score", 0)
	Globals.set("number_of_lifes", 3)
	Globals.set("amount_of_kunais", 5)