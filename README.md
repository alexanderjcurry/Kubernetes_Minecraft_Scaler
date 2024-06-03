**Minecraft Server Deployment on Kubernetes:**

This repository contains scripts and configuration files to automate the deployment of multiple Minecraft servers on a Kubernetes cluster.

**Enviorment:**

Kubernetes cluster running version v1.26.15

Ubuntu 24.04 LTS

**Files in This Repository:**

create-minecraft-servers.sh: Bash script to automate the creation of multiple Minecraft server deployments and services.

refresh_script.sh: Bash script to delete all Minecraft server resources in the specified namespace.

minecraft-env-config.yml: Kubernetes ConfigMap defining environment variables for Minecraft server configuration.

minecraft-config.yml: Kubernetes ConfigMap containing the server.properties file for Minecraft server configuration.

deployment-template.yml: Template for Kubernetes Deployment resource to deploy Minecraft servers.

service-template.yml: Template for Kubernetes Service resource to expose Minecraft servers.

**Setup Instructions:**

git clone https://github.com/alexanderjcurry/Kubernetes_Minecraft_Scaler.git

cd Kubernetes_Minecraft_Scaler

Ensure All Files Are in the Same Directory.

Run the Create Script

./create-minecraft-servers.sh

You will be prompted for the number of servers, starting server number, and starting NodePort.

**Verify the Deployment:**

kubectl get pods -n minecraft

kubectl get services -n minecraft

**To Delete All Minecraft Resources:**

./refresh_script.sh

**How It Works:**

create-minecraft-servers.sh: Prompts for the number of servers, starting server number, and starting NodePort. Creates the minecraft namespace, applies ConfigMaps, and creates Minecraft server deployments and services.
refresh_script.sh: Deletes all deployments, services, pods, and configmaps in the minecraft namespace and optionally deletes the namespace itself.
