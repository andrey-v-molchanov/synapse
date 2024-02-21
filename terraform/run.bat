# Plan and import
# terraform plan --generate-config-out=generated_resources.tf -var-file=secrets.tfvars

terraform apply -var-file=secrets.tfvars 

# Destroy
# terraform destroy -var-file=secrets.tfvars 

# Show what we have in tfstate
# terraform show

# Apply drift from real world to TF state
# terraform refresh -var-file=secrets.tfvars 