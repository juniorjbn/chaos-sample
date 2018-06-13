#!/bin/bash

TYPE=node

aws ec2 describe-instances --query 'Reservations[*].Instances[*].InstanceId' --output text --filters Name=instance.group-name,Values=$TYPE* > /tmp/list_instances_shot.txt 

aws ec2 describe-instances --query 'Reservations[*].Instances[*].NetworkInterfaces[*].PrivateIpAddress' --filters Name=instance.group-name,Values=$TYPE* > /tmp/list_instances_shot_ip

echo "Shotting machines" 
head -n -1 /tmp/list_instances_shot_ip

for i in `head -n -1 /tmp/list_instances_shot.txt`
  do
	aws ec2 terminate-instances --instance-ids $i 
done

