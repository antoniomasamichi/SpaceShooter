
extends Node2D

var laser = preload("res://laser.xml")
var laserCount = 0

var isSpacePressed = false


func _ready():
	set_process(true)
	
	
	
	
	
func _process(delta):
	if Input.is_action_pressed("Space"):
		if isSpacePressed == false:
			fire()
			isSpacePressed = true
	else:
		isSpacePressed = false
		
	var shipPos = get_node("Ship").get_pos()
	
	if Input.is_action_pressed("ui_left"):
		shipPos.x = shipPos.x - 100 * delta
		
		
	if Input.is_action_pressed("ui_right"):	
			shipPos.x = shipPos.x + 100 * delta
	
	get_node("Ship").set_pos(shipPos)


func fire():
	laserCount = laserCount + 1
	print("fire!")
	var laser_instance = laser.instance()
	laser_instance.set_name("laser" + str(laserCount))
	add_child(laser_instance)
	var laserPos = get_node("laser" + str(laserCount)).get_pos()
	var shipPos = get_node("Ship").get_pos()
	laserPos.y = 500
	laserPos.x = shipPos.x
	get_node("laser" + str(laserCount)).set_pos(laserPos)