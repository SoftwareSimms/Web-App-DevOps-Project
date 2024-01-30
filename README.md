# Web-App DevOps Project - Enhanced Version by Jack Simms

Welcome to the enhanced version of the Web-App DevOps Project! My name is Jack Simms, and in this fork of Maya's Python and Azure SQL application, I have introduced modern DevOps practices to improve the project's scalability, reliability, and deployment efficiency. This includes integrating Azure Kubernetes Service (AKS), using Terraform for infrastructure management, Docker for containerization, and implementing a robust version control workflow.

## Table of Contents

- [Flowchart of Implementated DevOps Pipelines](#flowchart-of-implementated-devops-pipelines)
- [Why These Enhancements?](#why-these-enhancements)
- [Original Features](#original-features)
- [Getting Started with Enhanced Version](#getting-started-with-enhanced-version)
- [Technology Stack Enhancement](#technology-stack-enhancement)
- [Documentation](#documentation)
- [Contributors](#contributors)
- [License](#license)

## Flowchart of Implementated DevOps Pipelines

![DevOps Pipeline Architecture](/DevOps Pipeline Architecture.png)

### Pipeline Flow

1. **Build Environment with Terraform**
   - The process begins with the developer using Terraform, an infrastructure as code tool, to provision the required cloud infrastructure on Azure. This step ensures that the infrastructure setup is repeatable and consistent.

2. **Commit to Source Control**
   - Developers commit their application code changes to a source code repository, such as GitHub. This represents the version control stage and is crucial for tracking changes and managing the codebase.

3. **Pull Secrets from Azure Key Vaults**
   - Secrets, like API keys and database credentials, are securely pulled from Azure Key Vaults during the pipeline execution. Azure Key Vaults is designed to protect cryptographic keys and secrets used by cloud applications.

4. **Build Docker Containers with Azure Pipelines**
   - Azure Pipelines automates the containerization of the application by building Docker containers. This step packages the application with all its dependencies, ensuring consistency across different environments.

5. **Push Containers to Docker Hub**
   - The built Docker container images are then pushed to a container registry, in this case, Docker Hub, which is a service for managing and sharing container images.

6. **Deploy Application to Azure Kubernetes Service (AKS)**
   - The AKS cluster receives the containerized application for deployment. Azure Kubernetes Service facilitates the deployment, management, and scaling of containerized applications with Kubernetes.

7. **Monitor Application with Azure Tools**
   - Post-deployment, tools such as Azure Monitor, Application Insights, and Log Analytics Workspaces are used to monitor the health and performance of the application. They provide valuable insights to detect and troubleshoot potential issues.



## Why These Enhancements?

The enhancements made to the original Web-App DevOps Project are designed to:

- **Improve Scalability:** By using AKS, the application can now handle increased load more efficiently.
- **Enhance Reliability:** Containerization with Docker ensures that the application runs consistently across different environments.
- **Automate Infrastructure Management:** Terraform allows for automated and reproducible infrastructure setups, reducing manual errors and saving time.
- **Streamline Development:** The updated version control workflow fosters better collaboration and easier feature integration.

## Original Features

- **Order List, Pagination, Add New Order, Data Validation:** The core functionalities of viewing, adding, and validating order data remain intact and are now supported by a more robust backend infrastructure.

## Getting Started with Enhanced Version

### Prerequisites

- Docker installed on your machine.
- Terraform installed on your machine.
- An Azure account for AKS.
- Git for cloning the repository.

### Setup and Deployment

1. **Clone the Repository:** Start by cloning this enhanced repository to your local system.
2. **Docker Setup:** Build the Docker image using the provided Dockerfile and run the container.
3. **Terraform Initialization:** Initialize Terraform to set up the necessary infrastructure on Azure.
4. **AKS Deployment:** Deploy the application on AKS using the provided Kubernetes manifests.
5. **Local Testing:** Follow the steps for local testing to ensure everything is set up correctly.

## Technology Stack Enhancement

- **Docker:** For containerization, ensuring consistency across development, testing, and production environments.
- **Azure Kubernetes Service (AKS):** For orchestration, managing containers, scaling, and automated rollouts.
- **Terraform:** For Infrastructure as Code (IaC), enabling consistent and repeatable cloud environment setups.
- **GitHub:** Advanced version control to better manage and track changes.

## Documentation

Detailed documentation is available in this repository, covering aspects such as version control strategies, containerization steps, Terraform configurations, Kubernetes deployment processes, and Azure Key Vault integration.

## Contributors

- [Jack Simms](https://github.com/softwaresimms) - Enhancements and integration of DevOps practices.
- [Maya Iuga](https://github.com/maya-a-iuga) - Original creator of the Web-App DevOps Project.

## License

This project, like the original, is licensed under the MIT License. For more details, refer to the [LICENSE](LICENSE) file.