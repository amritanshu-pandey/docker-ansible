FROM amritanshu16/docker-base:latest
LABEL maintainer='Amritanshu Pandey <email@amritanshu.in>'

RUN apt update -y && apt dist-upgrade -y && apt install python3 python3-pip -y && pip3 install ansible
ADD root /

CMD /initialise.sh
