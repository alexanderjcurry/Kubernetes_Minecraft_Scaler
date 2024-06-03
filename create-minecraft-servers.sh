#!/bin/bash

NAMESPACE=minecraft

# Prompt for the number of servers to create
read -p "Enter the number of Minecraft servers to create: " NUM_SERVERS

# Prompt for the starting NodePort
read -p "Enter the starting NodePort (e.g., 30005 for the next available port after 30004): " START_PORT

# Create the namespace if it doesn't exist
kubectl get namespace $NAMESPACE || kubectl create namespace $NAMESPACE

for i in $(seq 1 $NUM_SERVERS); do
  SERVER_NUM=$((START_PORT - 30000 + i))
  NODE_PORT=$((START_PORT + i - 1))

  # Replace placeholders in deployment template
  cat deployment-template.yml | sed "s/{{SERVER_NUM}}/$SERVER_NUM/g" | kubectl apply -f -

  # Replace placeholders in service template
  cat service-template.yml | sed "s/{{SERVER_NUM}}/$SERVER_NUM/g" | sed "s/{{NODE_PORT}}/$NODE_PORT/g" | kubectl apply -f -

  echo "Created Minecraft server $SERVER_NUM with NodePort $NODE_PORT"
done
