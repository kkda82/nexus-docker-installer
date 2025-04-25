#!/bin/bash

echo "[+] Nexus CLI 컨테이너 빌드 및 실행..."
docker-compose up -d --build

sleep 5

echo "[+] Nexus CLI 설치 중..."
docker exec -it nexus-node bash -c "curl https://cli.nexus.xyz/ | sh"

echo "[+] Nexus CLI 진입!"
docker exec -it nexus-node bash
