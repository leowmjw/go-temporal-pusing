# go-temporal-pusing
Temporal Demo for controlled k8s Node Rotation

Use WorkflowID == NodeGroup name

Assumption:

- The ASG for each LaunchTemplate updated to the latest AMI version
- Example: Setup via Terraform Blueprint

Steps:

- Start listening to ; on failure switch to polling method
- Cordon off all the nodes; no eviction
- Once at least one node healthy that matches target version,  is NOT cordon; move on
- Inventory of services / pods in chosen Node; compare overall healthy
- Trigger Eviction; including volume, statefulset + daemonset
- Listen / poll for k8s event of evicted so that there is healthy
- Look out for pending; warn at 5 mins, give up at 10 mins

