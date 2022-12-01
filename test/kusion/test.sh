#!/bin/bash

# This test file will be executed against an auto-generated devcontainer.json that
# includes the 'kusion' feature with no options.
#
# Eg:
# {
#    "image": "<..some-base-image...>",
#    "features": {
#      "kusion": {}
#    }
# }
#
# Thus, the value of all options, 
# will fall back to the default value in the feature's 'devcontainer-feature.json'
# For the 'kusion' feature, that means the default favorite kusion is 'red'.
# 
# This test can be run with the following command (from the root of this repo)
#    devcontainer features test \ 
#               --features kusion \
#               --base-image mcr.microsoft.com/devcontainers/base:bullseye .

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "version" kusion version | grep 'releaseVersion: v0.7.1'
check "version" kcl -V | grep 'kclvm version is 0.4.3;'

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults