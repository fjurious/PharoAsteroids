Class {
	#name : #MediumAsteroid,
	#superclass : #Asteroid,
	#category : #'TIEA1130-Asteroids'
}

{ #category : #initialization }
MediumAsteroid >> initialize [
	super initialize.
	self color: Color black.
	self borderColor: Color orange.
	self borderWidth: 2.
	self extent: (self extent*1.5).
	speedX := (-8.0 to: 8.0) atRandom.
	speedY := (-8.0 to: 8.0) atRandom.
]

{ #category : #'as yet unclassified' }
MediumAsteroid >> spawnSmallerAsteroid: aNumber [
	| newAsteroid splitAngle |
	newAsteroid := SmallAsteroid new.
	newAsteroid position: (self position).
	splitAngle := (((self speedX / self speedY) arcTan) radiansToDegrees) + aNumber.
	newAsteroid speedX: (splitAngle cos) * ((2 to: 6) atRandom).
	newAsteroid speedY: (splitAngle sin) * ((2 to: 6) atRandom).
	self owner addMorph: newAsteroid.
]
