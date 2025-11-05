#!/bin/bash
set -e

TMP_DIR="/tmp/deploy_backend"
DEPLOY_DIR="/var/www/backend"

echo "Creating backend deploy dir..."
mkdir -p $DEPLOY_DIR

echo "Copying files..."
rm -rf $DEPLOY_DIR/*
cp -r $TMP_DIR/* $DEPLOY_DIR/

cd $DEPLOY_DIR
if [ -f package.json ]; then
  echo "Installing production dependencies..."
  npm ci --only=production
fi

chown -R ubuntu:ubuntu $DEPLOY_DIR || true
echo "Backend install step completed."
