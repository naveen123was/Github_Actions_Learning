#!/bin/bash

echo "Validating image signatures..."
for image in $(docker images --format "{{.Repository}}:{{.Tag}}" | grep "icr.io/appcafe/open-liberty"); do
    cosign verify --key config/public-key.pem $image
done
