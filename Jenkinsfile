pipeline{
    environment {
        registry = "ansible007/test-jenkins"
        registryCredential = 'dockerpush'
        dockerImage = ""
    }
    agent any
    stages{
        stage('checkout'){
            steps{
                 checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/kunalkumar229/hello-test.git']]])
            }
           
        }
        stage('test'){
            steps{
                // sh 'newgrp docker'
                sh 'whoami'
                sh 'pwd'
                sh 'docker images'
                sh 'ls'
                
               
            }
            
        }
        stage('mvn-build'){
            steps{
                sh 'sudo mvn clean install -DskipTests'
                sh 'ls -R'
            }
        }
        
        stage('Building image') {
          steps{
            script {
              dockerImage = docker.build registry + ":$BUILD_NUMBER"
            }
          }
        }
        stage('Deploy Image') {
          steps{
             script {
                docker.withRegistry( '', registryCredential ) {
                dockerImage.push('')
              }
            }
          }
        }
        stage('Remove Unused docker image') {
          steps{
            sh "docker rmi $registry:$BUILD_NUMBER"
          }
        }
    }
}
