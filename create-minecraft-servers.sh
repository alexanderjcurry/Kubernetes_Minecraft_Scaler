#!/bin/bash

NAMESPACE=minecraft

echo "If you want a fresh wipe, run the refresh_script.sh first"

# Prompt for the number of servers to create
read -p "Enter the number of Minecraft servers to create: " NUM_SERVERS

# Prompt for the starting server number
read -p "Enter the starting server number (e.g., 1): " START_SERVER_NUM

# Prompt for the starting NodePort
read -p "Enter the starting NodePort (e.g., 30005 for the next available port after 30004): " START_PORT

# Create the namespace if it doesn't exist
kubectl get namespace $NAMESPACE || kubectl create namespace $NAMESPACE

# Apply the config files
kubectl apply -f minecraft-env-config.yml
kubectl apply -f minecraft-config.yml

for i in $(seq 0 $(($NUM_SERVERS - 1))); do
  SERVER_NUM=$((START_SERVER_NUM + i))
  NODE_PORT=$((START_PORT + i))

  # Replace placeholders in deployment template
  cat deployment-template.yml | sed "s/{{SERVER_NUM}}/$SERVER_NUM/g" | kubectl apply -f -

  # Replace placeholders in service template
  cat service-template.yml | sed "s/{{SERVER_NUM}}/$SERVER_NUM/g" | sed "s/{{NODE_PORT}}/$NODE_PORT/g" | kubectl apply -f -

  echo "Created Minecraft server $SERVER_NUM with NodePort $NODE_PORT"
done
