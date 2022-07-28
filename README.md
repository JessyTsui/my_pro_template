# douyin_spider_worker
## Introduction
nothing but study how to dev a project only


## Install
Make sure your local docker is running, Run the following shell file in the root directory of the project file
```bash
./build.sh
```
```bash
./dev.sh
```


## Test case
Go to the src/test/spider_test to see how to send the request to spider data.

## Mongodb

### resource/spider_user
database: resource

Doc collection: spider_user should have the following schema:

```
'_id': user unique id, not uuid,
'task_id': same with resource/task_info's task_id,
'follower_count': ...
'spider_operator': just to make it easy to record user, not used in this project
'task_time': time when the spider is executed
'total_favorited': ...
'user_id': user unique id, same with _id,
'user_name': ...
'user_type':just to make it easy to record user, not used in this project
'video_count': ...
```


### resource/spider_video
database: resource

Doc collection: spider_video should have the following schema:

```
'_id': video id, not uuid, you can request 'https://www.douyin.com/video/{id}' to get the detail page
'task_id': same with resource/task_info's task_id,
'comment_count': comment，
'spider_operator': just to make it easy to record user, not used in this project,
'task_time': time when the spider is executed,
'cos_video': cos path,
'digg_count': digg,
'duration': format duration,
'original_title': ...
'original_url': ...
'publish_time': ...
'share_count': share
'user_id': douyin user unique id, not uuid
'user_name': ...
'user_url': ...
'video_id': same with _id
'video_tag': video title tag
'video_url': temporary download url, unimportant
```


### resource/task_info
database: resource

Doc collection: task_info should have the following schema:

```
'_id': task id, uuid4
'output_dir': output dir on CosBrowser,
'spider_operator': just to make it easy to record user, not used in this project,
'start_crawl_time': only crawl videos after this time,
'task_time': time when the task is created,
'user_type': just to make it easy to record user, not used in this project,
'task_id': same with _id,
'user_url': douyin user url,

```
