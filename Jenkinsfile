pipeline {
    agent any

    environment {
        GOOGLE_CREDENTIALS = ''
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the Terraform scripts from your repository
                checkout scm
            }
        }

        stage('Init Terraform') {
            steps {
                // Initialize Terraform
                bat 'terraform init'
            }
        }

        stage('Apply Terraform') {
            steps {

                withCredentials([file(credentialsId: 'f70d39d6-4d52-471e-beec-8104704059c1', variable: 'GOOGLE_CREDENTIALS')]) {
                    bat 'echo $GOOGLE_CREDENTIALS > $GOOGLE_CREDENTIALS_FILE'
                    bat 'export GOOGLE_APPLICATION_CREDENTIALS=$PWD/$GOOGLE_CREDENTIALS_FILE'
                     bat 'terraform apply -auto-approve'
                }

                // Apply the Terraform scripts to create the GKE cluster
               
                
            }
        }
    }
}
