#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=godofshinobi/ml-app

# Step 2
# Run the Docker Hub container with kubernetes
k3s kubectl run ml-app --image=$dockerpath --port=80

# Step 3:
# List kubernetes pods
k3s kubectl get pods

# Step 4:
# Forward the container port to a host
k3s kubectl port-forward ml-app 8000:80
