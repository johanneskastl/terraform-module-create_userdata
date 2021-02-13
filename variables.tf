#

variable "userdata_disable_root" {
  type        = string
  description = "Value for disable_root (allowed values are true/false)"
  default     = "true"
}

variable "userdata_fix_slow_ssh_login" {
  type        = string
  description = "Fix the slow SSH login by disabling UseDNS, GSSAPIAuthentication and others of that kidney"
  default     = "false"
}

variable "userdata_image_name" {
  type        = string
  description = "Name of the image used to create the instance(s)"
}

variable "userdata_manage_etc_hosts" {
  type        = string
  description = "Value for manage_etc_hosts (allowed values are true/template/false/localhost)"
  default     = "false"
}

variable "userdata_manage_resolv_conf" {
  type        = string
  description = "Value for manage_resolv_conf (allowed values are true/false)"
  default     = "false"
}

variable "userdata_ssh_pwauth" {
  type        = bool
  description = "Value for ssh_pwauth (allowed values are true/false)"
  default     = false
}

variable "userdata_ssh_user" {
  type        = string
  description = "Username for a user if that user should be created"
  default     = ""
}

variable "userdata_ssh_pubkey" {
  type        = string
  description = "SSH public key that should be injected into the instances"
  default     = ""
}

variable "userdata_sudo_allow_everything" {
  type        = bool
  description = "Allow the user to execute all commands with password-less sudo?"
  default     = false
}

variable "userdata_output_file_name" {
  type        = string
  description = "Filename to use for the local file"
  default     = "userdata_from_template.txt"
}
