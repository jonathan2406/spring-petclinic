#!groovy

pipeline {
  agent none
  stages {
    stage('Maven Install') {
      agent {
        docker {
          image 'maven:3.8.8'
        }
      }
      steps {
        sh 'mvn clean install'
      }
    }
    stage('Docker Build') {
      agent any
      steps {
        sh 'docker build -t siyahkugu/spring-petclinic:latest .'
      }
    }
    stage('Docker Push') {
      agent any
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
          sh "echo ${env.dockerHubPassword} | docker login -u ${env.dockerHubUser} --password-stdin"
          sh 'docker push siyahkugu/spring-petclinic:latest'
          sh 'docker logout' 
        }
      }
    }
  }
}