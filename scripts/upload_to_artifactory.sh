#!/bin/bash

ARTIFACTORY_URL="trialcqy6d3.jfrog.io/apphosting-docker-remote"

echo "Uploading images to JFrog Artifactory..."
for image in $(docker images --format "{{.Repository}}:{{.Tag}}" | grep "icr.io/appcafe/open-liberty"); do
    docker tag $image $ARTIFACTORY_URL/$image
    docker push $ARTIFACTORY_URL/$image
done
