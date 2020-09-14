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
                    sh label: '', returnStatus: true, script: 'terraform workspace new dev'

                }
            }
            stage('Terraform dev-workspace-destroy') {
                steps {
                    sh label: '', script: 'terraform destroy -var-file=dev.tfvars --auto-approve'

                }
            }
            stage('Creating-S3-Bucket') {
                steps {
                    script {
                        creates3bucket('prasad-0607')
                    }
                    }
            }
        }
    }

def creates3bucket(bucketName){
    sh returnStatus: true, script: "aws s3 mb ${bucketName} --region=us-east-1"
}
