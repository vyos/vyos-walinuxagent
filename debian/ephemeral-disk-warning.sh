#!/bin/sh
dev_resource=$(readlink -f /dev/disk/azure/resource-part1)
dev_resource_mp=$(mount | awk '$1==R {print$3}' "R=${dev_resource}")
warn_file="${dev_resource_mp}/DATALOSS_WARNING_README.txt"

if [ ! -f "${warn_file}" ]; then
    cat > ${warn_file} <<EOM
WARNING: THIS IS A TEMPORARY DISK.

Any data stored on this drive is SUBJECT TO LOSS and THERE IS NO WAY TO
RECOVER IT.

Please do not use this disk for storing any personal or application data.

For additional details to please refer to the MSDN documentation at:
http://msdn.microsoft.com/en-us/library/windowsazure/jj672979.aspx
EOM

    chmod 0444 ${warn_file}
    chattr +i ${warn_file}
    logger "Added ephemeral disk warning to ${warn_file}"
fi

