pipeline {
    environment {
    registry = "dkjahuwqkjsahiasuqwnksajhi/qunote"
    registryCredential = 'DOCKER_HUB_PASSWORD'
    dockerImage = 'dkjahuwqkjsahiasuqwnksajhi/java:backend'
    githubUrl = "github_url"

    }

    agent any
    stages {
            stage('Cloning our Git') {
                steps {
                git branch: 'development1', credentialsId: 'github_cred', url: 'github_url'
                }
            }

            stage('Building Docker Image') {
                steps {
                    script {
                        dockerImage = docker.build registry + ":$BUILD_NUMBER"
                    }
                }
            }

            stage('Deploying Docker Image to Dockerhub') {
                steps {
                    script {
                        docker.withRegistry('', registryCredential) {
                        dockerImage.push()
                        }
                    }
                }
            }

           stage('Deploying Docker Image to pull on EC2') {
                steps {
                    script {
                        docker.withRegistry('', registryCredential) {
                        dockerImage.pull()
                        }
                    }
                }
            }

           stage('Run docker image as container') {
                steps {
                    script {
                        //sshagent(['server']) {
                            //sh "docker stop qunote"
                            //sh "docker rm qunote"
                            sh "docker run -d -p 8091:8091 --name java  javademo/java:${env.BUILD_NUMBER}"
                        }
                    }
                }
           }
    }