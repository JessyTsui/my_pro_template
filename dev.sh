TAG=${1:-latest}

docker run --rm -it \
    -p 5000:5000 \
    -v /etc/localtime:/etc/localtime:ro \
    -v "$PWD/src":"/opt/douyin-spider-worker" \
     douyin-spider-worker:$TAG \
     conda run --no-capture-output --name douyin-spider-worker python3 app.py -d -vv