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
        stage('Build') {
            steps {
                withVault([configuration: configuration, vaultSecrets: secrets]) {
                    sh "docker login registry.xps.lan -u ${env.docker_user} -p ${env.docker_password}"
                    sh "docker build -t registry.xps.lan/amritanshu16/ansible:ci ."
                    sh "docker push registry.xps.lan/amritanshu16/ansible:ci"
                }
            }
        }
        stage('Test') {
            steps {
                withVault([configuration: configuration, vaultSecrets: secrets]) {
                    sh "docker run- it --rm registry.xps.lan/amritanshu16/ansible:ci"
                }
            }
        }
        stage('Publish') {
            steps {
                withVault([configuration: configuration, vaultSecrets: secrets]) {
                    sh "export ANSIBLE_VERSION=\$(docker run -it --rm registry.xps.lan/amritanshu16/ansible:ci bash -c 'ansible --version | head -1 | cut -f2 -d\' \')"
                    sh "docker tag registry.xps.lan/amritanshu16/ansible:ci registry.xps.lan/amritanshu16/ansible:latest"
                    sh "docker tag registry.xps.lan/amritanshu16/ansible:ci registry.xps.lan/amritanshu16/ansible:${ANSIBLE_VERSION}"
                    sh "docker push registry.xps.lan/amritanshu16/ansible:${ANSIBLE_VERSION}"
                    sh "docker push registry.xps.lan/amritanshu16/ansible:latest"
                }
            }
        }
    }
}