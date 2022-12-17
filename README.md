Inspired by https://github.com/mtlynch/firestore-emulator-docker, 
also docs are partially copied from there.

# Google Cloud Firestore Emulator

A [Google Cloud Firestore Emulator](https://cloud.google.com/sdk/gcloud/reference/beta/emulators/firestore/) container image. The image creates a local, standalone Firestore emulator for testing Firestore-backed apps.

## Quickstart

To run the emulator in a standalone Docker container:

```bash
docker run \
  --env "FIRESTORE_PROJECT_ID=demo-project-id" \
  --publish 8080:80 \
  <imagename>
```

## Environment variables

* `FIRESTORE_PROJECT_ID`: This is the Google Cloud Project ID that the emulator uses.
    * This does not have to correspond to a real Google Cloud Project ID, although it can if you want it to.
    * Your application must set its firestore project ID value to match this environment variable.
