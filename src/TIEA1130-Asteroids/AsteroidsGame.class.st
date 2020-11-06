Class {
	#name : #AsteroidsGame,
	#superclass : #SystemWindow,
	#instVars : [
		'asteroidsWorld',
		'keySet'
	],
	#category : #'TIEA1130-Asteroids'
}

{ #category : #'as yet unclassified' }
AsteroidsGame class >> play [
	AsteroidsGame new
		openInWorld.
]

{ #category : #'as yet unclassified' }
AsteroidsGame >> gameOver [
	self shouldBeImplemented 
]

{ #category : #'as yet unclassified' }
AsteroidsGame >> handleControls [
	(keySet includes: 28)
		ifTrue: [ asteroidsWorld rotatePlayerLeft ].
	(keySet includes: 29)
		ifTrue: [ asteroidsWorld rotatePlayerRight ].
	(keySet includes: 30)
		ifTrue: [ asteroidsWorld thrustPlayer ].
		
			
]

{ #category : #'events-processing' }
AsteroidsGame >> handleKeyDown: anEvent [
	| keyValue |
	keyValue := anEvent keyValue.
	keyValue = 28		"left arrow"
			ifTrue: [ keySet add: 28 ].
	keyValue = 29		"right arrow"
			ifTrue: [ keySet add: 29 ].
	keyValue = 30      "up arrow"
			ifTrue: [ keySet add: 30 ].
]

{ #category : #'events-processing' }
AsteroidsGame >> handleKeyUp: anEvent [
	| keyValue |
	keyValue := anEvent keyValue.
	keyValue = 28		"left arrow"
			ifTrue: [ keySet remove: keyValue ].
	keyValue = 29		"right arrow"
			ifTrue: [ keySet remove: keyValue ].
	keyValue = 30      "up arrow"
			ifTrue: [ keySet remove: keyValue ].
]

{ #category : #'event handling' }
AsteroidsGame >> handlesMouseOver: anEvent [ 
    ^true
]

{ #category : #initialization }
AsteroidsGame >> initialize [
	super initialize.
	keySet := Set new.
	self newGame.
	self color: Color black.
	self extent: 640@480.
	self 
			setLabel: 'Asteroids';
			beUnresizeable
]

{ #category : #accessing }
AsteroidsGame >> keySet: aNumber [
	keySet add: aNumber.
]

{ #category : #'event handling' }
AsteroidsGame >> mouseEnter: anEvent [ 
    anEvent hand newKeyboardFocus: self	
]

{ #category : #'event handling' }
AsteroidsGame >> mouseLeave: anEvent [ 
    anEvent hand newKeyboardFocus: nil
]

{ #category : #'instance creation' }
AsteroidsGame >> newGame [
	asteroidsWorld := self spawnAsteroidsWorld.
]

{ #category : #'instance creation' }
AsteroidsGame >> spawnAsteroidsWorld [
	asteroidsWorld := AsteroidsWorld new.
	self
		addMorph: asteroidsWorld
		frame: (0@0 corner: 1@1).
	^asteroidsWorld
]
