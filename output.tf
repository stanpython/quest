
output "clb_dns_name" {
  value       = aws_alb.application_load_balancer.dns_name
  description = "The domain name of the load balancer"
}

output "ecr_repo_name" {
  value       = aws_ecr_repository.my_first_ecr_repo.name
  description = "The name of the ecr repo"
}

output "ecr_repo_url" {
  value       = aws_ecr_repository.my_first_ecr_repo.repository_url
  description = "The ip address of the ecr repo"
}
