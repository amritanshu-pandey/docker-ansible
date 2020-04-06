# docker-ansible [![Build Status](https://dev.azure.com/amritanshupandey/amritanshu_pandey/_apis/build/status/amritanshu-pandey.docker-ansible?branchName=master)](https://dev.azure.com/amritanshupandey/amritanshu_pandey/_build/latest?definitionId=7&branchName=master)
A docker image with Ansible preinstalled

## Features
- Initialisation process allows executing multiple init scripts to be executed
  every time the container is started


## Usage
- Use this docker image as source
- Add init scripts in directory '/etc/initialise.sh.d'
- script `/etc/initialise.sh.d/00-motd.sh` is already baked into the image
  that could be overwritten to customise the motd message.
