def secrets = [
  [path: 'cisecrets/nginx.xps.lan', engineVersion: 2, secretValues: [
    [envVar: 'SSL_CERTIFICATE', vaultKey: 'SSL_CERTIFICATE'],
    [envVar: 'SSL_CERTIFICATE_KEY', vaultKey: 'SSL_CERTIFICATE_KEY']]],
  [path: 'cisecrets/jenkins.xps.lan', engineVersion: 2, secretValues: [
    [envVar: 'SSH_PRIVATE_KEY', vaultKey: 'ssh_private_key']]]
]
def configuration = [
    vaultUrl: 'https://vault.xps.lan',
    vaultCredentialId: 'vault-ciuser',
    engineVersion: 2,
    skipSslVerification: 'true'
]

pipeline {
    agent { node }
    stages {
        stage('Test') {
            steps {
                withVault([configuration: configuration, vaultSecrets: secrets]) {
                    sh "docker build -t registry.xps.lan/amritanshu16/ansible:ci ."
                    sh "docker push registry.xps.lan/amritanshu16/ansible:ci"
                }
            }
        }
    }
}