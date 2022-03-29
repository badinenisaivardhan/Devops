pipeline {
    agent any 
    environment{
        VERSION = "${env.BUILD_ID}"
    }
    stages {
        stage('Building Docker Image') {
            steps {
                script{
                    sh '''
                        cd /var/lib/jenkins/workspace/Pipelinejob_1/
                        docker build -t myimage:${VERSION} .
                    '''
                }
            }
        }
        stage('Image Ready To Deploy') {
            steps {
                script{
                    timeout(10){
                        mail bcc: '', body: "<br>Project: ${env.JOB_NAME} <br>Build Number: ${env.BUILD_NUMBER} <br> Go to build url and approve the deployment request <br> URL de build: ${env.BUILD_URL}/console", cc: '', charset: 'UTF-8', from: '', mimeType: 'text/html', replyTo: '', subject: "${currentBuild.result} CI: Project name -> ${env.JOB_NAME}", to: "badinenisaivardhan@gmail.com";
                        input(id: "Deploy Gate", message: "Deploy ${params.project_name}?", ok: 'Deploy')
                    }
                }

            }
        }
        stage('Deploy') {
            steps {
                script{
                    sh '''
                        docker run -dp 3000:3000 dockerbuild:${VERSION}
                    '''
                }
            }
        }
    }
}