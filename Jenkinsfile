pipeline {
  environment {
    registry = "ncrmns/helloworld11"
    registryCredential = 'dockerhubncrmns'
  }
  agent any
  stages {
    stage('Build') {
        steps {
            checkout scm
            sh 'docker build -t ncrmns/helloworld11 .'
        }
    }
    stage('Test'){
        steps{
            echo 'Test complete'
        }
    }
    stage('Building image') {
      steps{
        script {
          docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage ('Deploy') {
			when {
				branch 'dev'
			}
			steps {
				script {
					docker.withRegistry( '', registryCredential ) {
						dockerImage.push()
					}
				}
			}
		}
  }
}