pipeline {
    agent any // run on any available Jenkins agent

    stages {

        stage('Checkout') {
            steps {
                checkout scm // Downloads the project's source code from the configured Git repository.
            }
        }

        stage('Build') {
            steps {
                sh 'chmod +x app.sh'
                sh './app.sh'
            }
        }

        stage('Test') {
            steps {
                sh 'chmod +x test.sh'
                sh './test.sh'
            }
        }

        stage('Archive') {
            steps {
                archiveArtifacts artifacts: 'app.sh', fingerprint: true
                // fingerprint is unique hash of file for each build, helps track file across builds
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully.'
        }

        failure {
            echo 'Pipeline failed.'
        }

        always {
            cleanWs() //Clean Workspace: deletes all files from the current job's workspace
        }
    }
}
