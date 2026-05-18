pipeline {
    agent any

    environment {
        IMAGE_NAME = "carwebsite"
        CONTAINER_NAME = "carwebsite-container"
    }

    stages {

        stage('Clone Latest Code') {
            steps {
                git branch: 'main',
                url: 'https://github.com/MaheshKumar1533/carwebsite-main.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Stop Old Container') {
            steps {
                sh '''
                docker stop $CONTAINER_NAME || true
                docker rm $CONTAINER_NAME || true
                '''
            }
        }

        stage('Run New Container') {
            steps {
                sh '''
                docker run -d \
                --name $CONTAINER_NAME \
                -p 80:80 \
                $IMAGE_NAME
                '''
            }
        }
    }
}
