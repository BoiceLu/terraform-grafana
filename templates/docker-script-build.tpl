cat > /root/docker-install.sh <<- "SCRIPT"
#!/bin/bash

##################Install docker#################
curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun

#################Install Docker Compose##########
sudo curl -L https://github.com/docker/compose/releases/download/v2.5.0/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

SCRIPT

