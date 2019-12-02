#

output "userdata" {
  value = data.template_file.create_userdata.rendered
}
