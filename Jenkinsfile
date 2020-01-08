pipeline {
    environment {
        dockerHub = 'valentinburk'
        dockerImage = 'uc-capstone'
        dockerVersion = '0.2'
    }
    agent any
    stages {
        stage('Lint') {
            steps {
                sh 'tidy -q -e **/*.html'
                sh '''docker run --rm -i hadolint/hadolint < Dockerfile'''
            }
        }
        stage('Docker build') {
            steps {
                script {
                    dockerImage = docker.build('${dockerHub}/${dockerImage}:${dockerVersion}')
                    docker.withRegistry('', 'docker-hub-creds') {
                        dockerImage.push()
                    }
                }
            }
        }        
    }
}