extends KinematicBody

var quik : int = 25
var acceleration : int = 10
var gravitation : int = 2
var impulse : float = 70

onready var head = $head

var velocity = Vector3()
var move_diraction = Vector3()

var sensitivity = config.sensitivity
var look_rotation = Vector3.ZERO

func _ready():
	$camera.set_as_toplevel(true)

func _process(_delta):
	$animation.playback_speed = velocity.z / 20
	if velocity.y < -256: config.dead()

func _physics_process(delta):
	head.rotation_degrees.x = look_rotation.x
	rotation_degrees.y = look_rotation.y

	if not is_on_floor(): velocity.y -= gravitation
	if Input.is_action_pressed("ui_ctrl"): velocity.y -= gravitation * 2
	elif Input.is_action_pressed("ui_shift"): velocity *= Vector3(1.1,1,1.1)
	elif Input.is_action_pressed("ui_alt"): velocity /= Vector3(2,1,2)
	if Input.is_action_pressed("ui_select") and is_on_floor(): velocity.y = impulse

	move_diraction = Vector3(Input.get_axis("ui_left", "ui_right"),0,Input.get_axis("ui_up", "ui_down")).normalized().rotated(Vector3.UP, rotation.y)
	velocity.x = lerp(velocity.x, move_diraction.x * quik, acceleration * delta)
	velocity.z = lerp(velocity.z, move_diraction.z * quik, acceleration * delta)
	velocity = move_and_slide(velocity, Vector3.UP)

func _input(event):
	if event is InputEventMouseMotion:
		head.rotation_degrees.z = event.relative.x * sensitivity / -1.25
		look_rotation.y -= (event.relative.x * sensitivity)
		look_rotation.x -= (event.relative.y * sensitivity)
		look_rotation.x = clamp(look_rotation.x, -90, 90)
