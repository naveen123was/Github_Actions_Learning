#!/bin/bash

REGISTRY="icr.io/appcafe/open-liberty"
VERSION="24.0.0.3"

echo "Pulling Open Liberty images for version $VERSION..."
for image in $(curl -s https://icr.io/v2/appcafe/open-liberty/tags/list | jq -r '.tags[]' | grep "^$VERSION$"); do
    docker pull $REGISTRY:$image
done
