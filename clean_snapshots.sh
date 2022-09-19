#!/bin/bash

VMS=$(sudo virsh list --with-snapshot --all --name)
for vm in ${VMS}
do
        if [ -n ${vm} ]
        then
                SNAPSHOTS=$(sudo virsh snapshot-list $vm --name)
                for snapshot in ${SNAPSHOTS}
                do
                        if [ -n ${snapshot} ]
                        then
                                sudo virsh snapshot-delete $vm $snapshot
                        fi
                done
        fi
done
