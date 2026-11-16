#!/bin/bash

echo "uncordon control nodes:"
for node in $(kubectl get nodes -l 'node-role.kubernetes.io/control-plane' -o name); do
    kubectl uncordon "$node"
done

echo "uncordon worker nodes:"
for node in $(kubectl get nodes -l '!node-role.kubernetes.io/control-plane' -o name); do
    kubectl uncordon "$node"
done

echo "all nodes uncordoned'