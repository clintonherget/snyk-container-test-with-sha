# snyk-container-test-with-sha

Simple wrapper script to inject the Docker image ID (SHA256) into a Snyk Container test result JSON payload.

Use in place of "snyk container test --json $IMAGE_NAME". The resulting payload should be identical output with the addition of "imageSha" and "imageId" fields in top level of the JSON object. 

#### Requirements
- *docker*
- *jq*
- *bash*

#### Usage
    snyk-container-test-with-sha.sh [OTHER_SNYK_TEST_ARGS] IMAGE_NAME
