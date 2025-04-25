#!/bin/bash

echo "📦 Nexus CLI Docker 환경 시작..."

# Docker 실행 확인
if ! docker info > /dev/null 2>&1; then
  echo "❌ Docker 데몬이 실행 중이 아닙니다."
  exit 1
fi

# 최신 이미지 pull
echo "[+] Docker Hub에서 Nexus 이미지 가져오는 중..."
docker pull kkda82/nexus-prebuilt:latest

# 컨테이너 실행
echo "[+] Nexus CLI 컨테이너 실행..."
docker-compose up -d

# 컨테이너 로그 출력
docker logs -f nexus-node
