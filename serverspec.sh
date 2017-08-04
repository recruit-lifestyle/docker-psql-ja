#!/bin/bash

set -o xtrace
set -o errexit
set -o nounset

pushd serverspec/
rake spec
popd
