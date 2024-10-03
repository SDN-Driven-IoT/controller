#!/bin/bash

IFS=,
for node in $ONOS_NODES; do
	while ! sshpass -p rocks ssh -o StrictHostKeyChecking=no \
		-p 8101 onos@$node \
		app activate \
		org.onosproject.openflow \
		org.onosproject.fwd \
		org.onosproject.mlb; do
		sleep 5
	done
done
