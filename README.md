# Kubernetes_Minecraft_Scaler

This Bash script automates the deployment of multiple Minecraft servers in a Kubernetes environment. It prompts the user for the number of servers to create and the starting NodePort, then sets up the necessary Kubernetes resources using provided YAML templates.

Example Scenario
Imagine you are managing a Kubernetes cluster and want to deploy multiple instances of Minecraft servers quickly. This script will help you automate the process, ensuring each server instance has a unique identifier and NodePort for access. By running the script, you can specify how many servers you need and the starting port number, and the script will handle the creation and configuration of each server.

Usage
Create Deployment and Service Templates:

deployment-template.yml: Template for Kubernetes deployments, including placeholders for server numbers.
service-template.yml: Template for Kubernetes services, including placeholders for server numbers and NodePorts.
Run the Script:

./deploy-minecraft-servers.sh
Input Prompts:

Enter the number of Minecraft servers to create.
Enter the starting NodePort (e.g., 30005 for the next available port after 30004).
