pipeline {
    agent any
    tools {
        maven "Maven"
    }
    options {
        buildDiscarder logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '', numToKeepStr: '2')
        }
    triggers {
    pollSCM '* * * * *'
}

    stages {
        stage('CheckoutCode') {
            steps {
                git credentialsId: 'd52a650f-874a-414a-b725-21764bd93f63', url: 'https://github.com/PracticeOrg1234/Final_Project.git'
            }
        }
        stage('Build') {
            steps {
                sh "mvn clean package"
            }
        }
        stage('DeployintoTomcat') {
            steps {
                sshagent(['9798b472-a34d-437f-8819-3d662f108ea6']) {
                    sh "scp -o StrictHostKeyChecking=no target/FinalProject.war ubuntu@13.126.44.20:/opt/apache-tomcat-9.0.91/webapps"
                }
            }
        }
    }
}
