pipeline {
    agent any
    environment {
        def registry = 'https://github.com/asfahans/devops-automation'
        def registryhost = 'asfahans'
        def dockerhubusr = 'asfahans'
        def version = 'api-prod-1.0.'
        def namespace  = 'prod-asfahan'
    }
    stages {
        stage('Clean Up'){
            steps {
                deleteDir()
            }
        }
        stage('Clone Repo'){
            steps {
                sh 'git clone ${registry}.git'
            }
        }
        stage('Build Docker Image'){
            steps {
                dir('devops-automation') {
                    sh 'docker build -t ${registryhost}/devops-automation:${version}$BUILD_NUMBER .'
                }
            }
        }
        stage('Push Docker Image to Docker Hub'){
            steps {
                script {
                    withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                        sh 'docker login -u ${dockerhubusr} -p ${dockerhubpwd}'
                    }
                    sh 'docker push ${registryhost}/devops-automation:${version}$BUILD_NUMBER'
                }
            }
        }
    }
}
