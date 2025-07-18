#!/bin/bash

# Atualiza pacotes
yum update -y

# Instala dependências
yum install -y docker git

# Inicia Docker
service docker start
usermod -a -G docker ec2-user

# Instala docker-compose (se não estiver incluso)
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Clona seu repositório infra
cd /home/ec2-user || exit
git clone https://github.com/pedrxbro/url-shortner-infra.git
cd url-shortner-infra

# Sobe os containers
docker-compose up -d
