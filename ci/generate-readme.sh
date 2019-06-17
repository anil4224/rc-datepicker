#!/bin/sh

set -e

yarn
yarn generate-readme
git add src/README.md
if !git diff-index --quiet HEAD -- src/README.md; then
  git config --global user.name "nemobot";
  git config --global user.email "our-bots@buildo.io";
  git commit -m "Update README [skip CI]";
  git push origin master;
fi
