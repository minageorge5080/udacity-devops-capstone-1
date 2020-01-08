pipeline {
    environment {
        eksClusterName = 'uc-capstone-cluster'
        eksRegion = 'us-west-2'
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
        stage('K8S Deploy')  {
            steps {
                withAWS(credentials: 'aws-creds', region: eksRegion) {
                    sh 'aws eks --region=${eksRegion} update-kubeconfig --name ${eksClusterName}'
                    sh 'kubectl config use-context $(aws eks describe-cluster --name uc-capstone-cluster --region=us-west-2 | jq -r ''.cluster.arn'')'
                    sh 'kubectl apply -f k8s/uc-capstone-deployment.yml'
                }
            }
        }
    }
}