#!/usr/bin/env bash
set -euo pipefail

# Helper script to push the current main branch of the workspace repo
REPO_DIR="/workspaces/Jalo-Logistics"
BRANCH="main"
REMOTE="origin"

if [ ! -d "$REPO_DIR/.git" ]; then
  echo "Error: repository not found at $REPO_DIR" >&2
  exit 2
fi

cd "$REPO_DIR"

echo "Running: git add -A && git commit -m \"(auto) save before push\" || true"
# don't block if there is nothing to commit
git add -A || true
# Try to commit, but ignore exit if nothing to commit
git commit -m "(auto) save before push" || true

echo "Pushing $BRANCH to $REMOTE from $REPO_DIR"
git push "$REMOTE" "$BRANCH"

echo "Push complete."