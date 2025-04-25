#!/bin/bash

echo "📦 Nexus CLI Docker 환경 자동 설치 시작..."

# Docker 설치
sudo apt update
sudo apt install -y docker.io docker-compose git

# nexus-docker-installer 전체 클론
git clone https://github.com/kkda82/nexus-docker-installer.git
cd nexus-docker-installer/nexus-docker

# 사용자 홈 디렉토리 자동 설정
USER_NAME=$(whoami)
sed -i "s|HOME_DIR=.*|HOME_DIR=/home/$USER_NAME|g" .env

# 실행
chmod +x init.sh
./init.sh
