def secrets = [
  [path: 'cisecrets/jenkins.xps.lan', engineVersion: 2, secretValues: [
    [envVar: 'docker_user', vaultKey: 'docker_user'],
    [envVar: 'docker_password', vaultKey: 'docker_password'],
    ]]
]
def configuration = [
    vaultUrl: 'https://vault.xps.lan',
    vaultCredentialId: 'vault-ciuser',
    engineVersion: 2,
    skipSslVerification: 'true'
]

pipeline {
    agent { label 'jenkinsrunner1.xps.lan' }
    stages {
        stage('Test') {
            steps {
                withVault([configuration: configuration, vaultSecrets: secrets]) {
                    sh "docker login registry.xps.lan -u ${env.docker_user} -p ${env.docker_password}"
                    sh "docker build -t registry.xps.lan/amritanshu16/ansible:ci ."
                    sh "docker push registry.xps.lan/amritanshu16/ansible:ci"
                }
            }
        }
    }
}