#!/bin/bash

echo "drain worker nodes:"
for node in $(kubectl get nodes -l '!node-role.kubernetes.io/control-plane' -o name); do
    kubectl drain "$node" --ignore-daemonsets --delete-emptydir-data
done

echo "drain control nodes:"
for node in $(kubectl get nodes -l 'node-role.kubernetes.io/control-plane' -o name); do
    kubectl drain "$node" --ignore-daemonsets --delete-emptydir-data
done

echo "all nodes drained'