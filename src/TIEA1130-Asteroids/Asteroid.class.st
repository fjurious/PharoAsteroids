"
I represent an Asteroid.
"
Class {
	#name : #Asteroid,
	#superclass : #CircleMorph,
	#instVars : [
		'speedY',
		'speedX'
	],
	#category : #'TIEA1130-Asteroids'
}

{ #category : #'game logic' }
Asteroid >> detectCollision: aMorph [
	(self bounds intersects: aMorph bounds)
		ifTrue: [aMorph handleAsteroidCollision: self].
	
]

{ #category : #'collision handling' }
Asteroid >> handleAsteroidCollision: anAsteroid [
]

{ #category : #'collision handling' }
Asteroid >> handleBulletCollision: aBullet [
	self killAsteroid.

]

{ #category : #'collision handling' }
Asteroid >> handleShipCollision: aShip [
	self owner shipCollidedAsteroid: self.
]

{ #category : #'as yet unclassified' }
Asteroid >> killAsteroid [
	self spawnSmallerAsteroid: 45.
	self spawnSmallerAsteroid: -45.
	owner removeMorph: self.
	self delete.
]

{ #category : #'as yet unclassified' }
Asteroid >> spawnSmallerAsteroid:
	subclassresponsibility [
]

{ #category : #accessing }
Asteroid >> speedX [
	^ speedX
]

{ #category : #accessing }
Asteroid >> speedX: aNumber [
	speedX := aNumber
]

{ #category : #accessing }
Asteroid >> speedY [
	^ speedY
]

{ #category : #accessing }
Asteroid >> speedY: aNumber [
	speedY := aNumber
]

{ #category : #'stepping and presenter' }
Asteroid >> step [ 
	super.
	self top: (self top + speedY).
	self left: (self left + speedX).
	self wrapAround.
]

{ #category : #stepping }
Asteroid >> stepTime [ 
	^50
]

{ #category : #accessing }
Asteroid >> wrapAround [
	self bottom < self owner top 
		ifTrue: [ self top: self owner bottom ].
	self top > self owner bottom
		ifTrue: [ self bottom: self owner top ].
	self right < self owner left 
		ifTrue: [ self left: self owner right ].
	self left > self owner right 
		ifTrue: [ self right: self owner left ].
]
