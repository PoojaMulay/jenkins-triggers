pipeline {
    agent any
    tools{
        maven 'Maven_3_5_0'
    }
    stages{
        stage('Build the Maven'){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: '8d8dd1e0-e364-4b69-9a80-395a7ea7c71c', url: 'https://github.com/PoojaMulay/jenkins-triggers']])
                sh 'mvn clean install'
            }
        }
        stage('Build docker image'){
            steps{
                script{
                    sh 'docker build -t poojam09/jenkins-trigger .'
                }
            }
        }
        stage('push image to hub'){
            steps{
                script{
                    withCredentials([string(credentialsId: 'dockeruser', variable: 'dockerpw')]) {
                    sh 'docker login -u poojam09 -p Pooja@1993'

                    sh 'docker push poojam09/jenkins-trigger:latest'
                    }
                
                }   
            }
        }
    }
}
        
