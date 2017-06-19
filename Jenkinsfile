node {
	stage 'Checkout'
		checkout scm

	stage 'Build'
		bat 'nuget restore GameDice.sln'
		bat "\"${tool 'MSBuild'}\" GameDice.sln /p:Configuration=Release /p:Platform=\"Any CPU\" /p:ProductVersion=1.0.0.${env.BUILD_NUMBER}"

	stage 'Archive'
		archive 'GameDice/bin/Release/**'

}
