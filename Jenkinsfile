pipeline {
    agent any
        
            environment {
                IMAGE_NAME = 'Your_Image_Name'
                ACCOUNT_ID = 'Your_AWS_ACC_ID'
                DEFAULT_REGION = 'REGION_YOU_ARE_WORKING'
                CLUSTER_NAME = 'CLUSTER_NAME'
                SERVICE_NAME = 'ECS_SERVICE'
               } 
    stages {
        
        stage('fetch github code') {
            steps {
                git branch: 'main', url: 'https://github.com/NatinaelSeifu/tasking-frontend.git'
        
              }
            }
        stage('Build Docker Image') {
            steps {
                // Build the Docker image from the Dockerfile in the project root
                script {
                    sh "docker build -t ${IMAGE_NAME}:latest ."
                }
            }
        }
        
        stage('Tag the image') {
            steps {
                
                script {
                    sh "docker tag ${IMAGE_NAME}:latest ${ACCOUNT_ID}.dkr.ecr.${DEFAULT_REGION}.amazonaws.com/${IMAGE_NAME}:latest"
                }
            }
        }
        
        stage('Login to ECR registry') {
            steps {
                
                script {
                    sh "aws ecr get-login-password --region ${DEFAULT_REGION} | docker login --username AWS --password-stdin ${ACCOUNT_ID}.dkr.ecr.${DEFAULT_REGION}.amazonaws.com"
                }
            }
        }
        
        stage('Push Image to ECR') {
            steps {
                
                script {
                    sh "docker push ${ACCOUNT_ID}.dkr.ecr.${DEFAULT_REGION}.amazonaws.com/${IMAGE_NAME}:latest"
                }
            }
        }
        
        stage('Deploy to ECS Fargate') {
            steps {
                
                script {
                    sh "aws ecs update-service --cluster ${CLUSTOR_NAME} --service ${SERVICE_NAME} --force-new-deployment"
                }
            }
        }
    }



    
