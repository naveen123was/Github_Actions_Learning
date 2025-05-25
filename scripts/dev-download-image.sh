#!/bin/bash
# Usage: ./dev-download-image.sh <version> <type>
VERSION=$1
TYPE=$2
ARTIFACTORY_REGISTRY=${ARTIFACTORY_REGISTRY:-"mycompany.jfrog.io/my-docker"}

if [ -z "$VERSION" ] || [ -z "$TYPE" ]; then
  echo "Usage: $0 <version> <image-type>"
  exit 1
fi

docker login $ARTIFACTORY_REGISTRY
docker pull $ARTIFACTORY_REGISTRY/open-liberty:${VERSION}_${TYPE}