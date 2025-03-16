#!/bin/bash
# Script to set up a local Kubernetes environment with Argo Workflows

# Step 1: Install and start Minikube
echo "Setting up Minikube..."
minikube start --memory=4096 --cpus=2

# Step 2: Install Argo Workflows using kubectl
echo "Installing Argo Workflows..."
kubectl create namespace argo
kubectl apply -n argo -f https://github.com/argoproj/argo-workflows/releases/download/v3.4.7/install.yaml

# Step 3: Configure port forwarding to access Argo UI
echo "Setting up port forwarding for Argo UI..."
kubectl -n argo port-forward deployment/argo-server 2746:2746 &

echo "Setup completed!"
echo "Access the Argo UI at: https://localhost:2746"
