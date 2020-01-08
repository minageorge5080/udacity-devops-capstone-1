# Cloud DevOps Nanodegree Capstone

This project is a part of [Cloud DevOps Engineer Nanodegree](https://www.udacity.com/course/cloud-dev-ops-nanodegree--nd9991).

## Known Issues

> Pod Scheduling Failure. 0/1 nodes are available: 1 Insufficient pods.

Possible problem: `t2.micro` instance type is used for Worker Nodes. Minimum requirement is `t2.small`

> kubectl apply -f k8s/uc-capstone-deployment.yml
> error: You must be logged in to the server (the server has asked for the client to provide credentials)

Possible problem: User that is performing apply operation should be authorized. Try to modify a Kubernetes Cluster ConfigMap https://docs.aws.amazon.com/eks/latest/userguide/add-user-role.html