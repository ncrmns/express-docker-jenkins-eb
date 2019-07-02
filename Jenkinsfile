pipeline {
  environment {
    registry = "ncrmns/helloworld11"
    registryCredential = 'dockerhubncrmns'
    dockerImage = ''
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
    stage('Building DockerImage') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage ('==>DockerHub') {
			when {
				branch 'master'
			}
			steps {
				script {
					docker.withRegistry( '', registryCredential ) {
						dockerImage.push()
					}
				}
			}
		}
    stage ('==>AWS') {
			when {
				branch 'master'
			}
			steps {
				script {
          sh 'eb init --region us-east-1 --platform docker helloworld11'
          sh 'eb deploy helloworld11-dev'
					}
				}
			}
		}
  }