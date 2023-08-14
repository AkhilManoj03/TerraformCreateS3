pipeline {

    parameters {
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
    } 
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

   agent  any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/AkhilManoj03/TerraformCreateS3'
            }
        }
        stage('Plan') {
            steps {
                sh '/opt/homebrew/bin/terraform init'
                sh "/opt/homebrew/bin/terraform plan -out tfplan"
                sh '/opt/homebrew/bin/terraform show -no-color tfplan > tfplan.txt'
            }
        }
        stage('Approval') {
           when {
               not {
                   equals expected: true, actual: params.autoApprove
               }
           }

           steps {
               script {
                    def plan = readFile 'tfplan.txt'
                    input message: "Do you want to apply the plan?",
                    parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
               }
           }
       }

        stage('Apply') {
            steps {
                sh "/opt/homebrew/bin/terraform apply -input=false tfplan"
            }
        }
    }

  }
