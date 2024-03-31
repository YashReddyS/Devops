pipeline {
    agent any

    environment {
        GOOGLE_CREDENTIALS_ID = credentials('f70d39d6-4d52-471e-beec-8104704059c1')
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
                bat gcloud auth activate-service-account --key-file $GOOGLE_CREDENTIALS_ID
                // Apply the Terraform scripts to create the GKE cluster
                bat 'terraform apply -auto-approve'
                
            }
        }
    }
}
