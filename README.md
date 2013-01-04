openvz-utils
============

Quelques scripts pour openvz (proxmox).

vzmove
------

Vzmove permet de déplacer une VM vers un autre stockage sur le même serveur proxmox.

Utilisation :

    $ vzmove /mnt/pve/storage 101
    Starting migration of CT 101 to /mnt/pve/storage/private/101
    Syncing private
    Stopping container
    Starting container
    Cleanup
