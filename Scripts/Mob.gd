extends KinematicBody

var speed = 2
var max_health = 10
var health = 10
var velocity

func start(xform):
	transform.origin = xform.origin
	velocity = xform.basis.x * speed
	velocity = velocity.rotated(Vector3.UP, rand_range(-PI/4, PI/4))

func _physics_process(delta):
	velocity.y -= 1
	velocity = move_and_slide(velocity)
	if transform.origin.y < -50:
		queue_free()

func _on_Mob_input_event(camera, event, click_position, click_normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			health -= 1
			$HealthBar3D.update(health, max_health)
			if health <= 0:
				queue_free()