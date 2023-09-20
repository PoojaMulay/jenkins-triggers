pipeline {
    agent any
    tools{
        maven 'Maven_3_5_0'
    }
    stages{
        stage('Build Maven'){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: '8d8dd1e0-e364-4b69-9a80-395a7ea7c71c', url: 'https://github.com/PoojaMulay/jenkins-triggers']])
                sh 'mvn clean install'
            }
        }
        stage('Build docker image'){
            steps{
                script{
                    sh 'docker build -t pooja/jenkins-trigger .'
                }
            }
        }
        stage('push image to hub'){
            steps{
                script{
                    withCredentials([string(credentialsId: 'dockeruser', variable: 'dockerpw')]) {
                    sh 'sudo docker login -u pooja-user -p ${docker}'

                    sh 'sudo docker push 675821912463.dkr.ecr.us-east-1.amazonaws.com/dockerimage:latest'
                    }
                
                }   
            }
        }
    }
}
        
