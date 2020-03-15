## configure
export DIND_K8S_JOB_ID=$(shuf -i 2000-65000 -n 1)
echo JOB_ID: ${DIND_K8S_JOB_ID}
export DIND_K8S_JOB=1-dind-k8s
export DIND_K8S_INSTANCE=x${DIND_K8S_JOB}-${DIND_K8S_JOB_ID}
## spin-up cluster 
source scripts/spin-up-cluster.sh
## apply envs and deploy 
cat kubernetes/dind.yaml | envsubst | kubectl apply -f - 
# wait until ready 
while [ $(kubectl get pods | tail -n+2 | grep dind | awk '{print $3;}') != "Running" ]; do 
	echo waiting for master to be ready...
	sleep 5 
done
## get master 
MASTER=$(kubectl get pods | tail -n+2 | grep dind | awk '{print $1;}')
## enable background process execution 
set -m 
## run job 
echo $(kubectl exec -it dind -c docker-cmds docker run alpine echo "Alpine exectued in DinD on k8s") 
## shutdown clsuter 
source scripts/spin-down-cluster.sh 
