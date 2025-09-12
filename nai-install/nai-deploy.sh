#!/usr/bin/env bash

set -ex
set -o pipefail

helm repo add ntnx-charts https://nutanix.github.io/helm-releases
helm repo update ntnx-charts

#NAI-core
helm upgrade --install nai-core ntnx-charts/nai-core --version=$NAI_CORE_VERSION -n nai-system --create-namespace --wait \
--set imagePullSecret.credentials.username=$DOCKER_USERNAME \
--set imagePullSecret.credentials.password=$DOCKER_PASSWORD \
--insecure-skip-tls-verify \
--set naiApi.storageClassName=$NAI_API_RWX_STORAGECLASS \
--set defaultStorageClassName=$NAI_DEFAULT_RWO_STORAGECLASS \
-f nkp-values.yaml