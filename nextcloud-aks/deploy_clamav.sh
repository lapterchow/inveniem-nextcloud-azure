#!/usr/bin/env bash

##
# This script deploys the ClamAV daemon backend to Kubernetes.
#
# @author Guy Elsmore-Paddock (guy@inveniem.com)
# @copyright Copyright (c) 2019, Inveniem
# @license GNU AGPL version 3 or any later version
#

set -e
set -u

source './config.env'

FILES=(
    'clamav.template.yaml'
)


echo "Deploying ClamAV Daemon..."
for file in "${FILES[@]}"; do
    ./preprocess_config.sh "configs/${file}" | kubectl apply -f -
done
echo "Done."
echo ""
