pipeline {
    agent any
    environment {
        // GIT
        GIT_URL = "https://github.com/yavhaa/Kubernetes-TP.git"
        GIT_BRANCH = "main"

        DOCKER_IMAGE = "nodejs:v1"

        USERNAME = "chedi1"
        TOKEN = credentials('DockerHub')
    }

    stages {
        stage('Clone & Switch to project branch') {
            steps {
                script {
                    checkout scm
                }
            }
        }
      
        stage('Build Image') {
            steps {
                script {
                    sh 'docker build -t ${DOCKER_IMAGE} .'
                }
            }
        }
        stage('Create Tag') {
            steps {
                script {
                    sh 'docker tag ${DOCKER_IMAGE} ${USERNAME}/${DOCKER_IMAGE}'
                }
            }
        }
        stage('Push Image') {
            steps {
                script {
                    sh 'echo ${TOKEN} | docker login -u ${USERNAME} --password-stdin'
                    sh 'docker push ${USERNAME}/${DOCKER_IMAGE}'
                }
            }
        }
        stage('Deploy Image') {
            steps {
                script {
                    sh 'sudo kubectl --kubeconfig .kube/config apply -f nodejs-deployment.yaml'
                }
            }
        }
    }
}
