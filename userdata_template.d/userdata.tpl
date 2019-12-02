#cloud-config

# set the /etc/hosts
manage_etc_hosts: ${MANAGE_ETC_HOSTS}

# manage /etc/resolv.conf
manage_resolv_conf: ${MANAGE_RESOLV_CONF}

# login as root disabled?
disable_root: ${DISABLE_ROOT}

# enable login with password
ssh_pwauth: ${SSH_PWAUTH}

%{ if SSH_PUBKEY != "" ~}
users:
  - name: root
    ssh_authorized_keys:
    - ${SSH_PUBKEY}
%{ if SSH_USER != "" ~}
  - name: ${SSH_USER}
%{ if SUDO_ALLOW_EVERYTHING ~}
    sudo: ALL=(ALL) NOPASSWD:ALL
%{ endif ~}
%{ if IMAGE_NAME != "SUSE Linux Enterprise Server 12 SP1" && IMAGE_NAME != "SUSE Linux Enterprise Server 12" ~}
    groups: sudo
%{ endif ~}
    shell: /bin/bash
    ssh_authorized_keys:
    - ${SSH_PUBKEY}
%{ endif ~}
%{ endif ~}

# eof
