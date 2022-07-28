import os
from functools import lru_cache

import yaml

CONFIG_FILE_PATH = "/etc/douyin-spider-worker/config.yaml"  # Use ../docker/config/config.yaml if running locally from src
# CONFIG_FILE_PATH = "../docker/config/config.yaml"
# CONFIG_FILE_PATH = "/Users/jessytsui/PycharmProjects/douyin-spider-worker/docker/config/config.yaml"

@lru_cache(maxsize=1)
def get_config():
    with open(CONFIG_FILE_PATH, "r") as stream:
        config_dict = yaml.safe_load(stream)
        return config_dict


@lru_cache(maxsize=1)
def is_qcloud_internal() -> bool:
    cloud_config_env = os.getenv("CLOUD_CONFIG")
    if cloud_config_env is None:
        return False
    else:
        return cloud_config_env.lower() == "qcloud" \
               or cloud_config_env.lower() == "tccloud"
