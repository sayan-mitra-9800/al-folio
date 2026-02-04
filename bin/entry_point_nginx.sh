#!/bin/bash
set -e

cd /srv/jekyll

bundle config set --local path 'vendor/bundle'
bundle install

echo "Building Jekyll site..."
bundle exec jekyll build

echo "Starting nginx on port 8080..."
exec nginx -g "daemon off;"
