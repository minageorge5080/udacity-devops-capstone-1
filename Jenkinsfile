pipeline {
    agent any
    stages {
        stage('Lint') {
            steps {
                sh 'echo $USER'
                sh 'tidy -q -e **/*.html'
                sh '''docker run --rm -i hadolint/hadolint < Dockerfile'''
            }
        }        
    }
}