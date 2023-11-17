Class {
	#name : #BaselineOfStMobSh,
	#superclass : #BaselineOf,
	#category : #BaselineOfStMobSh
}

{ #category : #loading }
BaselineOfStMobSh class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'st-mob-sh' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfStMobSh >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'StMobSh'
		]
]
