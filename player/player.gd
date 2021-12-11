extends KinematicBody2D

const MAX_SPEED := 250.0
const ACCEL := 0.3 # value between 0-1, used for vector linear interpolation

var velocity := Vector2()
var target_velocity := Vector2()

func take_input():
	target_velocity = Vector2()
	
	if Input.is_action_pressed("ui_up"):
		target_velocity.y = -MAX_SPEED
	if Input.is_action_pressed("ui_down"):
		target_velocity.y = MAX_SPEED
	if Input.is_action_pressed("ui_left"):
		target_velocity.x = -MAX_SPEED
	if Input.is_action_pressed("ui_right"):
		target_velocity.x = MAX_SPEED
	
	velocity = velocity.linear_interpolate(target_velocity, ACCEL)
	velocity = velocity.normalized() * min(MAX_SPEED, velocity.length())

func _physics_process(delta):
	
	take_input()
	
	move_and_collide(velocity * delta)
	
	
