FROM continuumio/miniconda3:4.10.3-alpine

WORKDIR /opt/douyin-spider-worker

# Need the following line in mainland China
COPY ./docker/tsinghua.condarc /root/.condarc

COPY ./docker/conda_env.yml /opt/douyin-spider-worker/conda_env.yml


RUN conda env create -f conda_env.yml && conda clean -afy
RUN rm -f conda_env.yml

# Need to separate the pip from conda env yaml so we can specify the mirror for mainland China
RUN conda run --no-capture-output --name douyin-spider-worker pip install --no-cache-dir urllib3==1.26.8 celery==5.2.6 pandas==1.4.2 python-dateutil==2.8.2 rq==1.9.0 openpyxl PyYAML==5.4.1 pymongo==4.0.1 cos-python-sdk-v5==1.9.15 fake_useragent==0.1.11 retry -i https://pypi.tuna.tsinghua.edu.cn/simple

COPY ./src .

COPY ./docker/config /etc/douyin-spider-worker

ENV NUM_PROCESS=2
ENV NUM_THREAD=2
ENV TIME_OUT=1800


CMD conda run --no-capture-output --name douyin-spider-worker uwsgi \
    --http 0.0.0.0:8088 \
    --uid root \
    --enable-threads \
    --lazy \
    --processes $NUM_PROCESS\
    --threads $NUM_THREAD \
    --logto /var/log/douyin-spider-worker.log \
    --protocol uwsgi \
    --http-timeout $TIME_OUT \
    --harakiri $TIME_OUT \
    --wsgi app:app