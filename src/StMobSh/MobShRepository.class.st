Class {
	#name : #MobShRepository,
	#superclass : #Object,
	#instVars : [
		'repository'
	],
	#category : #'StMobSh-Core'
}

{ #category : #'instance creation' }
MobShRepository class >> forRepoNamed: aString [ 
	^ self new
		repository: (GtIceGitRepository on: (GtGitRepository forRepoNamed: aString) icebergRepository repositoryDirectory);
		yourself.
]

{ #category : #accessing }
MobShRepository class >> on: aFileReference [
	^ self new
		repository:  (GtIceGitRepository on: aFileReference);
		yourself.
]

{ #category : #testing }
MobShRepository >> hasUncommitedChanges [
	^ (self repository
		runGitWithArgs: {'status'.
				'--porcelain'}) size ~= 0
]

{ #category : #'private - accessing' }
MobShRepository >> repository [
	^ repository
]

{ #category : #'private - initialization' }
MobShRepository >> repository: aRepository [
	repository := aRepository 
]
