Class {
	#name : #SmallAsteroid,
	#superclass : #Asteroid,
	#instVars : [
		'removalFlag'
	],
	#category : #'TIEA1130-Asteroids'
}

{ #category : #initialization }
SmallAsteroid >> initialize [
	super initialize.
	self color: Color black.
	self borderColor: Color red.
	self borderWidth: 2.
	self extent: (self extent*0.75).
	speedX := (-8.0 to: 8.0) atRandom.
	speedY := (-8.0 to: 8.0) atRandom.
	removalFlag := false.
]

{ #category : #'as yet unclassified' }
SmallAsteroid >> killAsteroid [
	removalFlag := true.
]

{ #category : #'stepping and presenter' }
SmallAsteroid >> step [
	super step.
	removalFlag ifTrue: [ self delete ].
]
