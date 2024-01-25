**Dockerized PHP Application with MySQL and Redis**


This repository contains the configuration and files necessary to build and deploy a Dockerized PHP application with MySQL and Redis. The continuous integration process is automated using GitHub Actions, and the deployment is targeted to an EC2 instance.

**Contents**


GitHub Actions Workflow
Deployment Script
Dockerfiles
Docker Compose
Deployment Steps

**Notes**

GitHub Actions Workflow
The ** .github/workflows/main.yml** file defines a GitHub Actions workflow for continuous integration. It performs the following steps:

Checks out the repository code.
Sets up Docker Buildx and QEMU for multi-platform builds.
Builds and pushes Docker images to Docker Hub using the specified Docker Compose file.
Installs sshpass to enable non-interactive SSH login.
Establishes an SSH connection to the EC2 instance and executes a deployment script.


**Deployment Script**

The **deploy.sh** script located in the root directory of the project is responsible for deploying the Docker containers on the EC2 instance. It performs the following actions:

Navigates to the project directory on the EC2 instance.
Pulls the latest changes from the Git repository.
Runs **docker-compose up -d** to start or restart the Docker containers.

**Dockerfiles**



**PHP Application Dockerfile (Dockerfile)**

Based on php:8.1.2-cli.
Sets up the working directory and copies application files.
Installs necessary dependencies (zip, unzip).
Installs Composer and runs composer install.
Exposes port 8000.
Defines the CMD to start the PHP built-in server.

**MySQL Dockerfile (Dockerfile.mysql)**

Based on mysql:latest.
Sets the root password and initializes a database.

**Redis Dockerfile (Dockerfile.redis)**

Based on ubuntu:22.04.
Installs and exposes the Redis server.

**Docker Compose**

The docker-compose.yml file orchestrates the setup of three services: php_app, mysql, and redis. It specifies the build context for each service and defines the necessary configurations, such as ports and environment variables.

**Deployment Steps**

Continuous Integration:

Push changes to the main branch.
GitHub Actions will automatically trigger the workflow, building and pushing Docker images.
Deployment:

Ensure the EC2 instance has Docker installed.
Set up Docker Compose on the EC2 instance.
Create a .env file on the EC2 instance with necessary environment variables.
Run the deploy.sh script on the EC2 instance.
