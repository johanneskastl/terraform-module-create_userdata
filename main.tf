# create userdata content from template
data "template_file" "create_userdata" {
  template = file("${path.module}/userdata_template.d/userdata.tpl")

  vars = {
    DISABLE_ROOT          = var.userdata_disable_root
    MANAGE_ETC_HOSTS      = var.userdata_manage_etc_hosts
    MANAGE_RESOLV_CONF    = var.userdata_manage_resolv_conf
    IMAGE_NAME            = var.userdata_image_name
    SSH_PWAUTH            = var.userdata_ssh_pwauth
    SSH_PUBKEY            = var.userdata_ssh_pubkey
    SSH_USER              = var.userdata_ssh_user
    SUDO_ALLOW_EVERYTHING = var.userdata_sudo_allow_everything
  }
}

# create a local file
resource "local_file" "userdata_from_template" {
    content         = data.template_file.create_userdata.rendered
    filename        = var.userdata_output_file_name
    file_permission = "0644"
}
