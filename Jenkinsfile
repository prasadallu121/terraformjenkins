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
                    sh label: '', returnStatus: true, script: 'terraform workspace delete dev'

                }
            }
            stage('Terraform dev-workspace-apply') {
                steps {
                    sh label: '', script: 'terraform destroy -var-file=dev.tfvars --auto-approve'

                }
            }
             stage('Terraform prod-workspace') {
                steps {
                    sh label: '', returnStatus: true, script: 'terraform workspace delete prod'

                }
            }
            stage('Terraform prod-workspace-apply') {
                steps {
                    sh label: '', script: 'terraform destroy -var-file=prod.tfvars --auto-approve'

                }
            }
             stage('Creating-S3-Bucket') {
                steps {
                    script{
                        CreateS3Bucket('pragnasreedevops')
                    }
                                    }
            }
                      
        }
    }

def CreateS3Bucket(bucketName) {
    sh returnStatus: true, script: "aws s3 rb s3://${bucketName} --region us-west-1"
}
