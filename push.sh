#!/usr/bin/env bash
# Pushes this folder to the coconut-kitchen repo and prints the Pages URL.
set -e

REMOTE="https://github.com/aymanhakeem3/coconut-kitchen.git"

if [ ! -f index.html ]; then
  echo "Run this from the folder containing index.html."; exit 1
fi

[ -d .git ] || git init -q
git add -A
git commit -q -m "Coconut Kitchen: installable recipe app" || echo "Nothing new to commit."
git branch -M main
git remote get-url origin >/dev/null 2>&1 || git remote add origin "$REMOTE"

echo "Pushing to $REMOTE"
if ! git push -u origin main; then
  echo
  echo "Push rejected. The repo already has commits. Either:"
  echo "  git pull --rebase origin main && git push -u origin main"
  echo "or, if the repo only has a starter README you don't need:"
  echo "  git push -u --force origin main"
  exit 1
fi

echo
echo "Done. Now: repo Settings -> Pages -> Deploy from a branch -> main -> / (root)"
echo "Then open on your phone:"
echo "  https://aymanhakeem3.github.io/coconut-kitchen/"
