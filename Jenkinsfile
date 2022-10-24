pipeline {
    agent any
    stages {
        stage("Clean Up"){
            steps {
                deleteDir()
            }
        }
        stage("Clone Repo"){
            steps {
                sh "git clone https://github.com/asfahans/devops-automation.git"
            }
        }
        stage("Build Docker Image"){
            steps {
                dir("devops-automation") {
                    sh "docker build -t asfahans/devops-automation ."
                }
            }
        }
        stage("Push Docker Image to Docker Hub"){
            steps {
                script {
                    withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                        sh 'docker login -u asfahans -p ${dockerhubpwd}'
                    }
                    sh 'docker push asfahans/devops-automation'
                }
            }
        }
    }
}
