# Kubernetes and Argo Workflows Demo Project

This project demonstrates a simple CI/CD pipeline using Kubernetes (k8s) and Argo Workflows. It deploys a basic Node.js application to a Kubernetes cluster using Argo Workflows for orchestration.

## Prerequisites

- Docker installed and configured
- Kubernetes CLI (kubectl) installed
- Minikube, Kind, or another local Kubernetes solution
- Git

## Setup Instructions

### 1. Clone this repository

```bash
git clone <your-repo-url>
cd k8s-argo-demo
```

### 2. Set up a local Kubernetes cluster and Argo Workflows

Run the setup script to create a local Kubernetes cluster and install Argo Workflows:

```bash
chmod +x scripts/setup.sh
./scripts/setup.sh
```

This script:
- Starts a Minikube cluster
- Installs Argo Workflows
- Sets up port forwarding to access the Argo UI

### 3. Build and push the Docker image

Replace `${YOUR_DOCKER_USERNAME}` in the Kubernetes manifests and Argo Workflow template with your Docker Hub username:

```bash
cd app
docker build -t yourusername/k8s-argo-demo:latest .
docker push yourusername/k8s-argo-demo:latest
```

### 4. Deploy the application manually (Optional)

Apply the Kubernetes manifests:

```bash
kubectl apply -f kubernetes/manifests.yaml
```

Check that your application is running:

```bash
kubectl get pods -n demo-app
```

### 5. Run the Argo Workflow

Submit the workflow to Argo:

```bash
kubectl apply -f argo/workflow.yaml
```

### 6. Access the application

```bash
kubectl port-forward -n demo-app svc/demo-app-service 8080:80
```

Then open [http://localhost:8080](http://localhost:8080) in your browser.

## Project Structure

- `app/`: Contains the Node.js application code and Dockerfile
- `kubernetes/`: Contains Kubernetes deployment manifests
- `argo/`: Contains Argo Workflow templates
- `scripts/`: Contains setup and utility scripts

## Learning Objectives Covered

- Setting up a local Kubernetes cluster
- Creating a basic containerized application
- Writing Kubernetes deployment manifests
- Understanding Kubernetes namespaces, deployments, services, and ingress
- Creating and running Argo Workflows
- Implementing a simple CI/CD pipeline

## Next Steps

Once you're comfortable with this basic setup, you can:

1. Add automated testing to your workflow
2. Implement environment-specific deployments (dev, staging, prod)
3. Add Argo CD for GitOps-style continuous delivery
4. Explore Argo Events for event-driven workflows
5. Implement rollback mechanisms for failed deployments

## Troubleshooting

- If you encounter issues with Docker socket permissions in Argo Workflows, make sure you've mounted the Docker socket correctly and have the necessary permissions.
- For Minikube, you might need to run `eval $(minikube docker-env)` to use the Minikube Docker daemon.
- If your ingress is not working, make sure you have an ingress controller installed in your cluster.
