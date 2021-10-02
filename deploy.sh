#!/bin/sh

# If a command fails then the deploy stops
set -e

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"


# Build the project.
hugo
# Add changes to git.
git add .
# Commit changes.
git commit -m "$1"
# Pushing changes.
git push


rm ../reeducation.github.io/en.search*
cp -R public/* ../reeducation.github.io/
rm -R public

cd ../reeducation.github.io

# Add changes to git.
git add .
# Commit changes.
git commit -m "$1"
# Pushing changes.
git push

printf "\033[0;32mSucessfully Deployed to GitHub Pages...\033[0m\n"
