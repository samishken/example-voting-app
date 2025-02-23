#!/bin/bash

# Configure Git user
git config --global user.email "devops4sam@gmail.com"
git config --global user.name "devops4sam"
git config --global core.autocrlf input

# Set the repository URL
REPO_URL="https://Epp83whEHACAAAAAAAAAAAAASAZDOlHJR@dev.azure.com/tutoriall/voting-app/_git/voting-app"

# Clone the git repository into the /tmp directory
git clone "$REPO_URL" /tmp/temp_repo

# Navigate into the cloned repository directory
cd /tmp/temp_repo

# Make changes to the Kubernetes manifest file(s)
# For example, let's say you want to change the image tag in a deployment.yaml file
sed -i "s|image:.*|image: samboovotingapp.azurecr.io/$2:$3|g" k8s-specifications/$1-deployment.yaml

# Add the modified files
git add .

# Commit the changes
git commit -m "Update Kubernetes manifest"

# Push the changes back to the repository
git push

# Cleanup: remove the temporary directory
rm -rf /tmp/temp_repo