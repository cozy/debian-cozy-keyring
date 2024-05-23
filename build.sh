#!/bin/bash
set -euo pipefail

apt update && apt install -y dpkg-dev debhelper
cd /build
[ ! -d pkgs ] && mkdir pkgs
dpkg-buildpackage -us -uc -b
mv ../*.deb pkgs
