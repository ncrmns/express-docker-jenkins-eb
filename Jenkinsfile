pipeline {
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
        stage('Deploy'){
            steps{
              sh "docker push ncrmns/helloworld11"
            }
        }
    }
}