pipeline {
    agent any

    stages {
        stage('Step 1: Git clone') {
            steps {
                git url: 'https://github.com/SrijanPrakash/CalculatorDevops.git',
				branch: 'main',
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
                sh 'docker build -t srijanprakash/calculator:latest .'
            }
        }
        stage('Publish Docker Images') {
            steps {
                withDockerRegistry([ credentialsId: "dockerhub", url: "" ]) {
                    sh 'docker push srijanprakash/calculator:latest'
                }
            }
        }
          stage('Clean Docker Images') {
            steps {
                sh 'docker rmi -f srijanprakash/calculator:latest'
            }
        }
        stage('Deploy and Run Image'){
            steps {
                ansiblePlaybook becomeUser: null, colorized: true, disableHostKeyChecking: true, installation: 'Ansible', inventory: 'inventory', playbook: 'p2.yml', sudoUser: null
            }
        }
        
        
    }  
}
