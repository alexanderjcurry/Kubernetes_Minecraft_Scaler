#!/bin/bash

#Use this if your pods are getting hung up and not deleting.

NAMESPACE=minecraft

# Function to force delete all pods in the namespace
force_delete_all_pods() {
  PODS=$(kubectl get pods -n $NAMESPACE -o jsonpath="{.items[*].metadata.name}")
  for POD in $PODS; do
    echo "Force deleting pod $POD in namespace $NAMESPACE"
    kubectl delete pod $POD -n $NAMESPACE --grace-period=0 --force
  done
}

echo "Forcefully deleting all pods in the namespace '$NAMESPACE'..."
force_delete_all_pods
echo "All pods in the namespace '$NAMESPACE' have been forcefully deleted."
