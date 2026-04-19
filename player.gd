extends CharacterBody3D

@export var speed := 5.0
@export var jump_velocity := 5.0
@export var gravity := 20.0


func _ready():
	floor_snap_length = 0.5

func _physics_process(delta):
	# гравитация
	if not is_on_floor():
		velocity.y -= gravity * delta
	else:
		velocity.y = 0
	floor_stop_on_slope = true

	# ввод
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = Vector3(input_dir.x, 0, input_dir.y)

	# движение
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = 0
		velocity.z = 0

	move_and_slide()
