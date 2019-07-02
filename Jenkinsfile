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
          docker.build registry
        }
      }
    }
    stage('Deploy'){
        steps{
          echo 'deploy'
          echo 'done'
        }
    }
  }
}