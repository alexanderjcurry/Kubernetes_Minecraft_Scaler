#!/bin/bash

NAMESPACE=minecraft

# Confirm the action
read -p "Are you sure you want to delete all Minecraft server resources in the namespace '$NAMESPACE'? [y/N]: " CONFIRMATION

if [[ "$CONFIRMATION" != "y" && "$CONFIRMATION" != "Y" ]]; then
  echo "Action canceled."
  exit 0
fi

# Delete all deployments in the namespace
echo "Deleting all deployments in the namespace '$NAMESPACE'..."
kubectl delete deployments --all -n $NAMESPACE

# Delete all services in the namespace
echo "Deleting all services in the namespace '$NAMESPACE'..."
kubectl delete services --all -n $NAMESPACE

# Delete all pods in the namespace
echo "Deleting all pods in the namespace '$NAMESPACE'..."
kubectl delete pods --all -n $NAMESPACE

# Delete all configmaps in the namespace
echo "Deleting all configmaps in the namespace '$NAMESPACE'..."
kubectl delete configmaps --all -n $NAMESPACE

# Optionally delete the namespace itself
read -p "Do you want to delete the namespace '$NAMESPACE' as well? [y/N]: " DELETE_NAMESPACE

if [[ "$DELETE_NAMESPACE" == "y" || "$DELETE_NAMESPACE" == "Y" ]]; then
  echo "Deleting the namespace '$NAMESPACE'..."
  kubectl delete namespace $NAMESPACE
else
  echo "Namespace '$NAMESPACE' not deleted."
fi

echo "All Minecraft server resources have been deleted."
