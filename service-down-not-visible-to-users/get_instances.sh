#!/bin/bash

while true ; do aws ec2 describe-instances --output text | grep "INSTANCES" | awk '{print $9 " - " $13}' | grep -v dev; echo "------------"; sleep 2 ; done
