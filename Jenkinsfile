pipeline {
    agent any 
        stages {
            stage('Git checkout') {
                steps {
                    git 'https://github.com/prasadallu121/terraformjenkins.git'
                }
            }
            stage('Terraform Init') {
                steps {
                    sh label: '', script: 'terraform init'

                }
            }
            stage('Terraform dev-workspace') {
                steps {
                    sh label: '', script: 'terraform workspace new dev'

                }
            }
            stage('Terraform dev-workspace-apply') {
                steps {
                    sh label: '', script: 'terraform apply -var-file=dev.tfvars --auto-approve'

                }
            }
        }
    }
