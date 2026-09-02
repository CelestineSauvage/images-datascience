#!/bin/bash
set -e

# Fetch rocker's scripts
git clone --branch R${R_VERSION} --depth 1 https://github.com/rocker-org/rocker-versioned2.git
mkdir -p /rocker_scripts
cp -a rocker-versioned2/scripts/. /rocker_scripts/
chmod -R 700 /rocker_scripts/

# Build R from source
/rocker_scripts/install_R_source.sh

# --- ISSUE SCRIPT GEOSPATIAL : https://github.com/rocker-org/rocker-versioned2/issues/1036 ---
# rm 'libhdf4-alt-dev' 
sed -i '/libhdf4-alt-dev/d' /rocker_scripts/install_geospatial.sh

# Clean
rm -rf rocker-versioned2/
