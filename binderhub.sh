#!/bin/bash

# Deploy binderhub.  Currently not possible:
# Error: 2 errors occurred:
#  * admission webhook "validation.gatekeeper.sh" denied the request: [block-daemonsets] Users are not allowed to deploy daemonsets
#  * admission webhook "validation.gatekeeper.sh" denied the request: [container-must-have-limits-and-requests] container <binderhub> does not have <{"cpu", "memory"}> requests defined

helm repo add binderhub-service https://2i2c.org/binderhub-service
helm repo update

helm upgrade \
  --install \
  --devel \
  --wait \
  --namespace biodiversity \
  my-binderhub \
  binderhub-service/binderhub-service \
  --values binderhub-service-config.yaml \
  --values secrets-binderhub.yaml

