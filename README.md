# Wisecow Application Deployment

## Overview
This repository contains the necessary files to containerize and deploy the Wisecow application on a Kubernetes environment with secure TLS communication. It also includes a CI/CD pipeline to automate the build and deployment process.

## Approach
### Dockerization
- **Docker Hub**: The Dockerfile has been created to build a Docker image for the Wisecow application. The Docker image is then pushed to Docker Hub.

### Kubernetes Deployment
- **Google Kubernetes Engine (GKE)**: Kubernetes manifest files (`deployment.yaml`, `service.yaml`, and `ingress.yaml`) have been created to deploy the Wisecow application on GKE and expose it as a service with secure TLS communication.

### CI/CD Pipeline
- **GitHub Actions**: A GitHub Actions workflow (`.github/workflows/ci-cd.yaml`) automates the build and deployment of the Docker image to the Kubernetes environment on GKE.

### TLS Implementation
- **Self-Signed Certificate**: A self-signed certificate is used to ensure secure TLS communication for the Wisecow application.
## Contributing
Feel free to contribute by creating pull requests or opening issues.

## License
This project is licensed under the MIT License.
