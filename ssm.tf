resource "aws_ssm_document" "myapp_dir_default_doc" {
  name          = "myapp_dir_default_doc"
  document_type = "Command"

  content = <<DOC
{
        "schemaVersion": "1.0",
        "description": "Join an instance to a domain",
        "runtimeConfig": {
           "aws:domainJoin": {
               "properties": {
                  "directoryId": "${aws_directory_service_directory.myapp_ad.id}",
                  "directoryName": "${var.dir_domain_name}",
                  "directoryOU": "${var.dir_computer_ou}",
                  "dnsIpAddresses": ${jsonencode(aws_directory_service_directory.myapp_ad.dns_ip_addresses)}
               }
           }
        }
}
DOC

  depends_on = [aws_directory_service_directory.myapp_ad]
}

resource "aws_ssm_association" "myapp_adwriter" {
  name        = "myapp_dir_default_doc"
  instance_id = aws_instance.vm_adwriter.id
  depends_on  = [aws_ssm_document.myapp_dir_default_doc, aws_instance.vm_adwriter]
}