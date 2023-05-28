pipeline {
    environment {
    registry = "9971rahulsingh/dockerdemo"
    registryCredential = 'DOCKER_HUB_PASSWORD'
    dockerImage = '9971rahulsingh/dockerdemo:java'
    githubUrl = "github_url"

    }

    agent any
    stages {
            stage('Cloning our Git') {
                steps {
                git credentialsId: 'github_cred', url: 'https://github.com/rahul278/spring-Jenkins.git'
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
                            sh "docker run -d -p 8091:8091 --name java  9971rahulsingh/dockerdemo:${env.BUILD_NUMBER}"
                        }
                    }
                }
           }
    }