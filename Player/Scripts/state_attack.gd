class_name State_attack extends State

var attacking : bool = false 

@export var attack_sound : AudioStream
@export_range(1,20,0.5) var decelerate_speed : float = 5.0

@onready var animation_player : AnimationPlayer = $"../../AnimationPlayer"
@onready var attack_anim : AnimationPlayer = $"../../Sprite2D/Attack sprite/AnimationPlayer"
@onready var audio : AudioStreamPlayer2D = $"../../Audio/AudioStreamPlayer2D"

@onready var Idle : State = $"../Idle"
@onready var Walk : State = $"../Walk"
@onready var hurt_box : HurtBox = %AttackHurtBox

## what happens when player enters this state?
func Enter() -> void:
	player.UpdateAnimation("attack")
	attack_anim.play( "attack_" + player.anim_direction()) 
	if not animation_player.animation_finished.is_connected(EndAttack):
		animation_player.animation_finished.connect(EndAttack)
	
	audio.stream = attack_sound
	audio.pitch_scale = randf_range(0.4, 1.8)
	audio.play()
	
	attacking = true
	
	
	await get_tree().create_timer( 0.08 ).timeout
	
	hurt_box.monitoring = true
	pass
	
	
## what happens when player exit's this state?
func Exit() -> void:
	animation_player.animation_finished.disconnect( EndAttack )
	attacking = false
	
	hurt_box.monitoring = false
	pass

func Process( _delta : float ) -> State:
	player.velocity -= player.velocity * decelerate_speed * _delta
	
	if attacking == false:
		if player.direction == Vector2.ZERO:
			return Idle
		else:
			return Walk
	return null 
	
	
	
	
## what happens during the _physicas_process update in this state?
func Physics( _delta : float ) -> State:
	return null
	
	
	
func HandleInput ( _event: InputEvent ) -> State:
	return null
	
	
	
	
func EndAttack( _newAnimName : String ) -> void:
	attacking = false
	
	
	
	
	
	
	
