#!/bin/bash
# 
# Builds a Docker image and pushes to an AWS ECR repository

set -e

source_path="$1" # 1st argument from command line
repository_url="$2" # 2nd argument from command line
tag="${3:-latest}" # Checks if 3rd argument exists, if not, use "latest"
repo_name="$4"

# splits string using '.' and picks 4th item
region="$(echo "$repository_url" | cut -d. -f4)" 

# splits string using '/' and picks 2nd item
image_name="$(echo "$repository_url" | cut -d/ -f2)" 

# login to ecr
aws ecr get-login-password --region "$region" | docker login --username AWS --password-stdin "$repository_url" 

# builds docker image
(cd "$source_path" && docker build -t "$repo_name" .) 

# tag image
docker tag "$repo_name":"$tag" "$repository_url":"$tag"

# push image
docker push "$repository_url":"$tag" 