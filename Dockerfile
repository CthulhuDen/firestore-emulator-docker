# syntax=docker/dockerfile:1.4-labs

FROM google/cloud-sdk:alpine

RUN apk add --update --no-cache openjdk17-jre \
    && gcloud components install cloud-firestore-emulator beta --quiet

COPY --chmod=0755 <<BASH /entrypoint.sh
#! /usr/bin/env bash

set -e

if [ -z "\$FIRESTORE_PROJECT_ID" ]
then
    echo "Must set FIRESTORE_PROJECT_ID variable"
    exit 1
fi

set -x

gcloud config set project "\$FIRESTORE_PROJECT_ID"
exec gcloud beta emulators firestore start --host-port="0.0.0.0:80"
BASH

ENTRYPOINT ["/entrypoint.sh"]
