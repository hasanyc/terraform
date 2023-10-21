# To Create
- terraform init
- terraform plan --var-file="s3-env-prod.tfvars" (env file - which may change. Depends on which env you are working on)
- terraform apply --var-file="s3-env-prod.tfvars" (env file - which may change. Depends on which env you are working on)

# To Delete the service
- terraform destroy --var-file="s3-env-prod.tfvars" (env file - which may change. Depends on which env you are working on)

# Git Push since I have multiple git profile
git push git@github.com-personal:hasanyc/terraform.git