pipeline {
    agent any

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
                    bat export GOOGLE_CREDENTIALS=${GOOGLE_CREDENTIALS}
                     bat 'terraform apply -auto-approve'
                }

                // Apply the Terraform scripts to create the GKE cluster
               
                
            }
        }
    }
}
