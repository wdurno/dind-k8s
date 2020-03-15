# dind-k8s

Run Docker in Docker (`dind`) in Kubernetes. This requires `--privileged`. I follow this [tutorial](https://applatix.com/case-docker-docker-kubernetes-part-2/).

Successful execution looks like this.
```
$ ./1-run-dind-in-k8s.sh
JOB_ID: 10883
WARNING: Starting with version 1.18, clusters will have shielded GKE nodes by default.
WARNING: The Pod address range limits the maximum size of the cluster. Please refer to https://cloud.google.com/kubernetes-engine/docs/how-to/flexible-pod-cidr to learn how to optimize IP address allocation.
This will enable the autorepair feature for nodes. Please see https://cloud.google.com/kubernetes-engine/docs/node-auto-repair for more information on node autorepairs.
Creating cluster x1-dind-k8s-10883 in us-central1-c... Cluster is being health-checked (master is healthy)...done.
Created [https://container.googleapis.com/v1beta1/projects/gdax-dnn/zones/us-central1-c/clusters/x1-dind-k8s-10883].
To inspect the contents of your cluster, go to: https://console.cloud.google.com/kubernetes/workload_/gcloud/us-central1-c/x1-dind-k8s-10883?project=gdax-dnn
kubeconfig entry generated for x1-dind-k8s-10883.
NAME               LOCATION       MASTER_VERSION  MASTER_IP       MACHINE_TYPE   NODE_VERSION    NUM_NODES  STATUS
x1-dind-k8s-10883  us-central1-c  1.14.10-gke.17  35.238.218.133  n1-standard-1  1.14.10-gke.17  3          RUNNING
pod/dind created
waiting for master to be ready...
waiting for master to be ready...
waiting for master to be ready...
waiting for master to be ready...
waiting for master to be ready...
c9b1b535fdd9: Pull complete
 Alpine exectued in DinD on k8s for alpine:latest7f981a7b70a79db3d1172b11c4367d
Deleting cluster x1-dind-k8s-10883...done.
Deleted [https://container.googleapis.com/v1/projects/gdax-dnn/zones/us-central1-c/clusters/x1-dind-k8s-10883].
```

