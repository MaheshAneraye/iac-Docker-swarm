output "manager_public_ip" {
  value = aws_instance.manager.public_ip
}

output "worker-1_public_ip" {
  value = aws_instance.worker-1.public_ip
}

output "worker-2_public_ip" {
  value = aws_instance.worker-2.public_ip
}