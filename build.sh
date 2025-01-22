#!/usr/bin/env bash

# 引数の個数をチェック
if [ $# -ne 1 ]; then
    echo "エラー: タグを指定してください。" >&2
    echo "使用方法: $0 <tag>" >&2
    exit 1
fi

TAG=$1

DOCKER_FILE_REL_PATH="./Dockerfile-${TAG}"

if [ ! -e "${DOCKER_FILE_REL_PATH}" ]; then
    echo "該当するタグのDockerfileを配置してください。: ${DOCKER_FILE_REL_PATH}" >&2
    exit 1
fi

docker build --tag "postgres-ja:${TAG}" --file "./Dockerfile-${TAG}" .
exit 0
