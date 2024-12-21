pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                git 'https://seu-repositorio-git/scripts/h.git'
            }
        }
        stage('Build') {
            steps {
                sh 'chmod +x teste.sh'
                sh './teste.sh'
            }
        }
        stage('Deploy') {
            steps {
                // Adicione aqui os comandos para deploy no servidor SUSE Linux
            }
        }
    }
}
