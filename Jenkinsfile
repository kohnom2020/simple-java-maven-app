pipeline {
    agent {
        docker {
            image 'maven:3-alpine'
            args '-v /root/.m2:/root/.m2'
        }
    }
    options {
        skipStagesAfterUnstable()
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn -B -DskipTests clean package'
            }
        }
        stage('Docker Build') {
            steps {
                sh "docker build . -t hello:${GIT_COMMIT}"
            }
        }
        stage('Deploy Container') {
            steps {
                sh "docker run -d --name hello -p 8080:8080 hello:${GIT_COMMIT}"
            }
        }
    }
}
