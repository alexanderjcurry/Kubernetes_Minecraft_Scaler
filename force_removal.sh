#!/bin/bash

#Use this if your pods are getting hung up and not deleting. 

#run this on worker node if there is a free roam zombie:

#This tells you if any containers are running.
  #sudo ctr -n k8s.io containers list | grep 'docker.io/itzg/minecraft-server:latest'
#You have to run this for each java instance running. If you see multiple java apps running in top, you'll have to run it many times. 
  #pkill -f java
#Delete the container.
  #sudo ctr -n k8s.io containers delete <containerID>


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
