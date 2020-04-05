extends KinematicBody2D


const UP = Vector2(0, -1)

# Movement parameters
var run_speed = 100
var jump_force = -350
var gravity = 20
var double_jump = 1

var velocity = Vector2()

func _physics_process(_delta):
	# gravity
	velocity.y += gravity
	
	# x movement
	if Input.is_action_pressed("ui_right"):
		velocity.x = run_speed
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = false
		
		
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -run_speed
		
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = true
		
	else:
		velocity.x = 0
		if is_on_floor():
			$AnimatedSprite.play("idle")
	
	# y movement
	if Input.is_action_just_pressed("ui_up"):
		if is_on_floor():
			double_jump = 1
			velocity.y = jump_force	
		elif double_jump == 1:
			velocity.y = jump_force
			double_jump = 0
			
	if !is_on_floor():
		if velocity.y < 0:
			$AnimatedSprite.play("jump")
		else:
			$AnimatedSprite.play("fall")

	velocity = move_and_slide(velocity, UP)
