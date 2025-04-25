#!/bin/bash

echo "📦 Nexus CLI Docker 환경 자동 설치 시작..."

# Docker 설치
if ! command -v docker &> /dev/null; then
  echo "🐳 Docker 설치 중..."
  sudo apt update
  sudo apt install -y docker.io
fi

# docker-compose 설치
if ! command -v docker-compose &> /dev/null; then
  echo "📦 docker-compose 설치 중..."
  sudo apt install -y docker-compose
fi

# 도커 데몬 실행 확인
if [ ! -S /var/run/docker.sock ]; then
  echo "🚀 Docker 데몬이 꺼져 있어 실행 중..."
  sudo dockerd > /tmp/dockerd.log 2>&1 &
  sleep 5
fi

# GitHub 클론 (필요 시)
if [ ! -d nexus-docker ]; then
  git clone https://github.com/kkda82/nexus-docker-installer.git
  cd nexus-docker-installer/nexus-docker
else
  cd nexus-docker
fi

# 사용자 환경설정
USER_NAME=$(whoami)
sed -i "s|HOME_DIR=.*|HOME_DIR=/home/$USER_NAME|g" .env

# 실행
chmod +x init.sh
./init.sh
