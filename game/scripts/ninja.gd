#!
# This script is responsible for ninja behaviors.
#
extends Node2D

# Ninja's speed
const NORMAL_SPEED = 10
const SPEED_TO_RUN = 50

func _ready():
	""" Called every time the node is added to the scene.
	Initialization here. """
	set_process(true)
	set_fixed_process(true)

func _fixed_process(delta):
	""" Called every frame. """
	# Ninja Attack
	#
	# Ninja movement
	move(delta)

func move(delta):
	""" Ninja movement. """
	var movement = Vector2(0, 0)
	# Check if the keys pressed
	if Input.is_action_pressed("ui_right"):
		movement.x += NORMAL_SPEED * delta
		get_node("body/sprite").set_flip_h(false)
	if Input.is_action_pressed("ui_left"):
		movement.x -= NORMAL_SPEED * delta
		get_node("body/sprite").set_flip_h(true)
	