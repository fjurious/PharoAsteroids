"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

I represent a gameworld of Asteroids.

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	player:		<Object>


    Implementation Points
"
Class {
	#name : #AsteroidsWorld,
	#superclass : #PanelMorph,
	#instVars : [
		'player'
	],
	#category : #'TIEA1130-Asteroids'
}

{ #category : #'as yet unclassified' }
AsteroidsWorld >> bulletCollidedAsteroid: anAsteroid [
	anAsteroid killAsteroid.
]

{ #category : #'collision handling' }
AsteroidsWorld >> detectCollisions [
	1 to: submorphs size do: 
		[ :i 	| i+1 to: submorphs size do: 
			[ :j | (submorphs at: i) detectCollision: (submorphs at: j)]].
	
]

{ #category : #initialization }
AsteroidsWorld >> initialize [
	super initialize.
	self extent: 640@480.
	self spawnAsteroids.
	self spawnPlayer.
	self fillStyle: Color black.
	
	
]

{ #category : #controlling }
AsteroidsWorld >> rotatePlayerLeft [
	player rotateLeft.
]

{ #category : #controlling }
AsteroidsWorld >> rotatePlayerRight [
	player rotateRight.
]

{ #category : #'collision handling' }
AsteroidsWorld >> shipCollidedAsteroid: anAsteroid [
	player takeHit.
	player bounce: anAsteroid.
	"(player hitpoints < 0) ifTrue: self owner gameOver."
	
]

{ #category : #'instance creation' }
AsteroidsWorld >> spawnAsteroids [
	| asteroid |
	asteroid := BigAsteroid new.
	self addMorph: asteroid.
	asteroid position: 60@60.
	
	asteroid := MediumAsteroid new.
	self addMorph: asteroid.
	asteroid position: 540@120.

	asteroid := SmallAsteroid new.
	self addMorph: asteroid.
	asteroid position: 120@360.


	
]

{ #category : #'instance creation' }
AsteroidsWorld >> spawnPlayer [
	player := Ship new.
	self addMorph: player.
	player position: 320@240.
	^ player
]

{ #category : #'as yet unclassified' }
AsteroidsWorld >> spawnProjectile [
	| p x y |
	p := Projectile new.
	y := (player center y - (10*((player heading + 90) degreesToRadians) sin)).
	x := (player center x - (10*((player heading + 90) degreesToRadians) cos)).
	self addMorph: p.
	p position: x@y.
	p speedY: -5*(((player heading + 90) degreesToRadians) sin).
	p speedX: -5*(((player heading + 90) degreesToRadians) cos).
]

{ #category : #'stepping and presenter' }
AsteroidsWorld >> step [ 
	super.
	self detectCollisions.
	self owner handleControls.
]

{ #category : #stepping }
AsteroidsWorld >> stepTime [ 
	^50
]

{ #category : #controlling }
AsteroidsWorld >> thrustPlayer [
	player thrust.
]

{ #category : #accessing }
AsteroidsWorld >> wrapAround [	
	submorphs bottom < submorphs owner top 
		ifTrue: [ submorphs top: submorphs owner bottom ].
	submorphs top > submorphs owner bottom
		ifTrue: [ submorphs bottom: submorphs owner top ].
	submorphs right < submorphs owner left 
		ifTrue: [ submorphs left: submorphs owner right ].
	submorphs left > submorphs owner right 
		ifTrue: [ submorphs right: submorphs owner left ].
]
