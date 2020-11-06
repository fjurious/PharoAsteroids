"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

I represent a projectile.

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	lifetime:		<Object>
	speed:		<Object>


    Implementation Points
"
Class {
	#name : #Projectile,
	#superclass : #CircleMorph,
	#instVars : [
		'speedX',
		'speedY',
		'lifetime'
	],
	#category : #'TIEA1130-Asteroids'
}

{ #category : #accessing }
Projectile >> decay [
	lifetime := lifetime -1.
	(lifetime < 0) ifTrue: [ self delete ].
]

{ #category : #'collision handling' }
Projectile >> detectCollision: aMorph [
	(self bounds intersects: aMorph bounds)
	ifTrue: [ aMorph handleBulletCollision: self. ]
	
]

{ #category : #'collision handling' }
Projectile >> handleAsteroidCollision: anAsteroid [

]

{ #category : #'collision handling' }
Projectile >> handleBulletCollision: aBullet [
]

{ #category : #initialization }
Projectile >> initialize [ 
	super initialize.
	self extent: (self extent*0.15).
	self color: Color yellow.
	self borderColor: Color yellow.
	lifetime := 25.
	
]

{ #category : #accessing }
Projectile >> lifetime [
	^ lifetime
]

{ #category : #accessing }
Projectile >> lifetime: aNumber [
	lifetime := aNumber
]

{ #category : #accessing }
Projectile >> speedX [
	^ speedX
]

{ #category : #accessing }
Projectile >> speedX: aNumber [
	speedX := aNumber
]

{ #category : #accessing }
Projectile >> speedY [
	^ speedY
]

{ #category : #accessing }
Projectile >> speedY: aNumber [
	speedY := aNumber
]

{ #category : #'stepping and presenter' }
Projectile >> step [ 
	super.
	self top: (self top + speedY).
	self left: (self left + speedX).
	self decay.
	self wrapAround.
	
]

{ #category : #stepping }
Projectile >> stepTime [ 
	^20
]

{ #category : #accessing }
Projectile >> wrapAround [
	(owner isNotNil)
	ifTrue: [ {  
	self bottom < self owner top 
		ifTrue: [ self top: self owner bottom ].
	self top > self owner bottom
		ifTrue: [ self bottom: self owner top ].
	self right < self owner left 
		ifTrue: [ self left: self owner right ].
	self left > self owner right 
		ifTrue: [ self right: self owner left ].
		} ]
]
