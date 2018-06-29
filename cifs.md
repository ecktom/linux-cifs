# Mounting Windows Network Shares

## Why
It could be possible that someone wants to access files stored on a `Windows Network Share` (aka. `smb` / `Samba Share`  / `CIFS`) using a linux system.
You need to either run the image in privileged mode or add capabilities: docker run --cap-add SYS_ADMIN --cap-add DAC_READ_SEARCH...

## How
1. Make sure cifs-support is available on the system:

    ```shell
    # Ubuntu / Debian / etc.
    apt install cifs-utils 

    # CentOS / Fedora / RHEL / etc.
    yum install samba-client samba-common cifs-utils
    ```

2. Mount the drive
    ```shell
    # Unprotected share:
    mount -t cifs <drive> <mountpoint>
    # e.g.: mount -t cifs //172.16.1.100/folder$ /mnt
    ```
    ```shell
    # Protected share:
    PASSWD=<pass> mount -t cifs -o username=<user> <drive> <mountpoint>
    # e.g.: PASSWD=pass mount -t cifs -o username=user //172.16.1.100/folder$ /mnt
    
    # The password needs to be provided using an command line variable. Since ..
    export PASSWD=pass
    # .. raises security concerns since the password is now available to the entire linux system, the password is provided using a command local variable.
    ```