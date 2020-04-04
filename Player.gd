extends KinematicBody2D


const UP = Vector2(0, -1)

# Movement parameters
var run_speed = 50
var jump_force = -150
var gravity = 10


var velocity = Vector2()

func _physics_process(delta):
	# gravity
	velocity.y += gravity
	
	# x movement
	if Input.is_action_pressed("ui_right"):
		velocity.x = run_speed
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -run_speed
	else:
		velocity.x = 0
	
	# y movement
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			velocity.y = jump_force
		

	velocity = move_and_slide(velocity, UP)
