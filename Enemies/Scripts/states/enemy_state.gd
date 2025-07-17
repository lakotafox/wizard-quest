class_name EnemyState extends Node


#stores a ref to the enemy that this is linked to 
var enemy : Enemy
var state_machine : EnemyStateMachine


#Initalize the state (for ram)
func init() -> void:
	pass
	
	
	#What happens when enemy enters the state?
func enter() -> void:
	pass
	
	
	#what happens when the enemy exits state?
func exit() -> void:
	pass
	
#called each frame
func process( _delta : float ) -> EnemyState:
	return null
	
#calls the _physics_process and upates in this state
func physics( _delta: float ) -> EnemyState:
	return null
		
