#!/bin/bash

if [[ $# -lt 1 ]] ; then
    echo 'Usage: snyk-container-test-with-sha.sh [OTHER_SNYK_TEST_ARGS] IMAGE_NAME'
    exit 0
fi

for ARG in $@; do :; done
IMAGE=$ARG

IMAGE_SHA=$(docker inspect --format "{{.Id}}" $IMAGE)
IMAGE_ID=$(docker history --format "{{.ID}}" $IMAGE | head -n 1)

snyk container test --json $@ | jq ". += {\"imageId\": \"$IMAGE_ID\", \"imageSha\": \"$IMAGE_SHA\"}"
