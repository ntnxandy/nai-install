#!/usr/bin/env bash

set -ex
set -o pipefail


kubectl patch gateway nai-ingress-gateway -n nai-system --type=merge \
-p '{
    "spec": {
        "infrastructure": {
            "parametersRef": {
                "group": "gateway.envoyproxy.io",
                "kind": "EnvoyProxy",
                "name": "envoy-service-config"
            }
        }
    }
}'