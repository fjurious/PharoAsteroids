"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

I represent a ship.

I listen to key controls and handle collisions with other game objects. I know my hitpoints and speed.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	hitpoints:		<Object>
	speedX:		<Object>
	speedY:		<Object>


    Implementation Points
"
Class {
	#name : #Ship,
	#superclass : #PolygonMorph,
	#instVars : [
		'speedY',
		'speedX',
		'hitpoints'
	],
	#category : #'TIEA1130-Asteroids'
}

{ #category : #'collision handling' }
Ship >> bounce: anAsteroid [
	| bounceDirection |
	bounceDirection := ((self center bearingToPoint: anAsteroid center) + 90) degreesToRadians.
	speedY := 5*(bounceDirection sin).
	speedX := 5*(bounceDirection cos). 
]

{ #category : #controlling }
Ship >> calculateSpeedComponents [
	| headingInRadians |
	headingInRadians := (self heading + 90) degreesToRadians.
	speedY := speedY + (headingInRadians sin).
	speedX := speedX + (headingInRadians cos).
	
	
]

{ #category : #'collision handling' }
Ship >> detectCollision: aMorph [
	(self bounds intersects: aMorph bounds)
		ifTrue: [aMorph handleShipCollision: self].

]

{ #category : #'collision handling' }
Ship >> handleAsteroidCollision: anAsteroid [
	self owner shipCollidedAsteroid: anAsteroid.
]

{ #category : #'as yet unclassified' }
Ship >> handleBulletCollision: aBullet [
]

{ #category : #accessing }
Ship >> hitpoints [
	^ hitpoints
]

{ #category : #accessing }
Ship >> hitpoints: aNumber [
	hitpoints := aNumber
]

{ #category : #initialization }
Ship >> initialize [
	super initialize.
	vertices := { 10@15. 5@0. 15@0. }.
	self extent: (self extent) *1.5.
	color := Color black.
	borderWidth := 1.
	borderColor := Color white.
	smoothCurve := false.
	closed := true.
	speedX := 0.
	speedY := 0.
	hitpoints := 100.
	
]

{ #category : #'game controls' }
Ship >> rotateLeft [
	self rotationDegrees: (self rotationDegrees - 15)
]

{ #category : #'game controls' }
Ship >> rotateRight [
	self rotationDegrees: (self rotationDegrees + 15)
]

{ #category : #accessing }
Ship >> speedX [
	^ speedX
]

{ #category : #accessing }
Ship >> speedX: aNumber [
	speedX := aNumber
]

{ #category : #accessing }
Ship >> speedY [
	^ speedY
]

{ #category : #accessing }
Ship >> speedY: aNumber [
	speedY := aNumber
]

{ #category : #stepping }
Ship >> step [
	super step.
	self top: (self top + speedY).
	self left: (self left + speedX).
	self wrapAround.
]

{ #category : #stepping }
Ship >> stepTime [ 
	^50
]

{ #category : #interaction }
Ship >> takeHit [
	hitpoints := hitpoints -1.
	^hitpoints
]

{ #category : #'game controls' }
Ship >> thrust [
	"Implement thrusting: Spawn a Projectile from back of the ship and accelerate ship to opposite 	direction.
	Give Projectile speed."
	self calculateSpeedComponents.
	self owner spawnProjectile.
	

]

{ #category : #accessing }
Ship >> wrapAround [
	self bottom < self owner top 
		ifTrue: [ self top: self owner bottom ].
	self top > self owner bottom
		ifTrue: [ self bottom: self owner top ].
	self right < self owner left 
		ifTrue: [ self left: self owner right ].
	self left > self owner right 
		ifTrue: [ self right: self owner left ].

	
]
