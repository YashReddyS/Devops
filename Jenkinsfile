pipeline {
    agent any

    environment {
        GOOGLE_CREDENTIALS_ID = '6b92e7b7-fefa-477d-852c-e3d7903f6bbd'
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
                sh 'terraform init'
            }
        }

        stage('Apply Terraform') {
            steps {
                // Apply the Terraform scripts to create the GKE cluster
                sh 'terraform apply -auto-approve'
            }
        }
    }
}
