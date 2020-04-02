pipeline {
	agent any 
	
	stages {
		stage ('Copying Repository') {
			steps {
				echo '************************************************'
				echo 'Copying Files to Jenkins Server'
				build 'GitDownload'
				echo '************************************************'
			}
		}
		stage ('Maven Build') {
			steps{
				echo '************************************************'
				echo 'Running Maven Build'
				build 'MavenBuild'
				echo '************************************************'
			}
		}
		stage ('Transfer War Files') {
			steps{
				echo '************************************************'
				echo 'Transferring War Files to AppServer'
				build 'TransferWarFiles'
				echo '************************************************'
			}
		}
	}
}