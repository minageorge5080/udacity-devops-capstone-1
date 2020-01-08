pipeline {
    environment {
        dockerHub = 'valentinburk'
        dockerImage = 'uc-capstone'
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
                    dockerImage = docker.build('${dockerHub}/${dockerImage}:${GIT_REVISION,length=6}')
                    docker.withRegistry('', 'docker') {
                        dockerImage.push()
                    }
                }
            }
        }        
    }
}