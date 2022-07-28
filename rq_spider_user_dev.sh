QUEUE_NAME=${1:-panda_spider_douyin_user_video}
docker run -it --rm --network host \
  --env CLOUD_CONFIG=external \
  -v "${PWD}/src:/opt/douyin-spider-worker" \
  douyin-spider-worker:latest conda run --no-capture-output --name douyin-spider-worker rq worker ${QUEUE_NAME} \
  --url redis://:kI+KiDQuCBQIQEp7McBa4vPND+gNOQ@sh-crs-2dosbgmj.sql.tencentcdb.com:28033 \
  --path ./ \
  --name "local-test-worker$RANDOM-$(date +"%Y-%m-%d-%T")"
