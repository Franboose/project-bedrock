# project-bedrock
## Deploying the UI service
helm upgrade ui oci://public.ecr.aws/aws-containers/retail-store-sample-ui-chart \
  --version 1.6.1 --reuse-values -f deployment/ui-values.yaml -n retail-app
