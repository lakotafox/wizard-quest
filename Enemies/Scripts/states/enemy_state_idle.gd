class_name EnemyStateIdle extends EnemyState

@export var anim_name : String = "idle"


@export_category("AI")
@export var state_duration_min : float = 0.1
@export var state_duration_max : float = 2.0
@export var after_idle_state : EnemyState

var _timer : float = 0.0

#Initalize the state (for ram)
func init() -> void:
	pass
	
	
	#What happens when enemy enters the state?
func enter() -> void:
	enemy.velocity = Vector2.ZERO
	_timer = randf_range( state_duration_min, state_duration_max)
	enemy.update_animation( anim_name )
	pass
	
	
	#what happens when the enemy exits state?
func exit() -> void:
	pass
	
#called each frame
func process( _delta : float ) -> EnemyState:
	_timer -= _delta
	if _timer < 0:
		return after_idle_state
	return null
	
#calls the _physics_process and upates in this state
func physics( _delta: float ) -> EnemyState:
	return null
		
