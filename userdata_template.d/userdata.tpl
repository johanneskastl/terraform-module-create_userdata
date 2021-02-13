#cloud-config
%{ if FIX_SLOW_SSH_LOGIN == "true" ~}

# Enable cloud-init modules
cloud_config_modules:
  - runcmd
%{ endif ~}

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
%{ if FIX_SLOW_SSH_LOGIN == "true" ~}

runcmd:
    - sed -i '/UseDNS/s/^.*$/UseDNS no/' /etc/ssh/sshd_config
    - sed -i '/ChallengeResponseAuthentication/s/^.*$/ChallengeResponseAuthentication no/' /etc/ssh/sshd_config
    - sed -i '/KerberosAuthentication/s/^.*$/KerberosAuthentication no/' /etc/ssh/sshd_config
    - sed -i '/GSSAPIAuthentication/s/^.*$/GSSAPIAuthentication no/' /etc/ssh/sshd_config
    - systemctl restart sshd
%{ endif ~}

# eof
