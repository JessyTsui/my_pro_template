TAG=${1:-latest}

docker build -t douyin-spider-worker:$TAG  -f ./docker/Dockerfile .