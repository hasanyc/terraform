# Pre condition
- Create a backend S3 bucket 
- Create a Terraform role first (must have valid Trust Relationship)

# Clone the project
- Git clone {repo name}
- cd terraform 
- cd {service name}. In our case cd s3 --> you will be in S3 service 

# To Create S3 Buckets - Same command can apply for other services such as EMR, ECR, EC2, VPC, VPN ect
- terraform init
- terraform plan --var-file="s3-env-prod.tfvars" (env file - which may change. Depends on which env you are working on)
- terraform apply --var-file="s3-env-prod.tfvars" (env file - which may change. Depends on which env you are working on)

# To Delete the S3 Service - Same command can apply for other services 
- terraform destroy --var-file="s3-env-prod.tfvars" (env file - which may change. Depends on which env you are working on)

# Git Push since I have multiple git profile
git push git@github.com-personal:hasanyc/terraform.git