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
                bat 'terraform init'
            }
        }

        stage('Apply Terraform') {
            steps {

                withCredentials([file(credentialsId: '6b92e7b7-fefa-477d-852c-e3d7903f6bbd', variable: 'GCLOUD_SERVICE_KEY')]) {

                    // Apply the Terraform scripts to create the GKE cluster
                    bat 'terraform apply -auto-approve'
                }
            }
        }
    }
}
