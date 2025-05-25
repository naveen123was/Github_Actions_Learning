# Open Liberty Image Sync Workflow (Docker Hub Edition)

## What does this do?
- Downloads (and optionally verifies) Open Liberty container images from Docker Hub.
- Publishes images to JFrog Artifactory with versioned tags.
- Checks for and syncs new versions every 15 days.
- Allows developers to pull any published version from Artifactory.

## How to use
1. Ensure required secrets are in your repo:
   - `ARTIFACTORY_REGISTRY`
   - `ARTIFACTORY_USERNAME`
   - `ARTIFACTORY_PASSWORD`
2. To sync or download an image, use the GitHub Actions workflow tab:
   - **image_version**: The version (e.g., `25.0.0.3`)
   - **image_type**: One of: `full-java8-openj9-ubi`, `full-java17-openj9-ubi`
   - **action**: `download` to download, `sync` to check and sync latest.

## Download image from Artifactory

```sh
docker login <your-artifactory-registry>
docker pull <your-artifactory-registry>/open-liberty:<versionnumber>_<imagetype>
# Example:
docker pull mycompany.jfrog.io/my-docker/open-liberty:25.0.0.3_full-java8-openj9-ubi
```