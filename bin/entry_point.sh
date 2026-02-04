#!/bin/bash
set -e

CONFIG_FILE="_config.yml"
JEKYLL_CMD="bundle exec jekyll serve --watch --port=8080 --host=0.0.0.0 --livereload --force_polling"

cd /srv/jekyll

# Install gems into vendor/bundle when running with mounted volume (creates Gemfile.lock and vendor/bundle)
bundle config set --local path 'vendor/bundle'
bundle install

# Start Jekyll in the background
$JEKYLL_CMD &
JEKYLL_PID=$!

while true; do
  if inotifywait -q -e modify,move,create,delete "$CONFIG_FILE" 2>/dev/null; then
    echo "Change detected in $CONFIG_FILE, restarting Jekyll"
    jekyll_pid=$(pgrep -f "jekyll serve" || true)
    [ -n "$jekyll_pid" ] && kill -KILL $jekyll_pid 2>/dev/null || true
    $JEKYLL_CMD &
  fi
done
