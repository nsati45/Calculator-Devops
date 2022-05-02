pipeline {
    agent any

    stages {
        stage('Step 1: Git clone') {
            steps {
                git url: 'https://github.com/nsati45/Calculator-Devops.git',
                credentialsId: 'github'
            }
        }
        stage('Step2 : Maven Build') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage('Build Docker Images') {
            steps {
                sh 'docker build -t nsati/calculator:latest .'
            }
        }
        stage('Publish Docker Images') {
            steps {
                withDockerRegistry([ credentialsId: "dockerhub", url: "" ]) {
                    sh 'docker push nsati/calculator:latest'
                }
            }
        }

         stage('Clean Docker Images') {
            steps {
                sh 'docker rmi -f nsati/calculator:latest'
            }
        }
        stage('Deploy and Run Image'){
            steps {
                ansiblePlaybook becomeUser: null, colorized: true, disableHostKeyChecking: true, installation: 'Ansible', inventory: 'inventory', playbook: 'p2.yml', sudoUser: null
            }
        }
    }


    post {
        always {
            sh 'docker logout'
        }
    }
}
