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
        }
    }