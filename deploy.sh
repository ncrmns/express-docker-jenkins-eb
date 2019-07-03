aws s3 cp ./Dockerrun.aws.json \
  s3://elasticbeanstalk-us-east-1-124429370407/helloworld11/Dockerrun.aws.json

aws elasticbeanstalk create-application-version \
  --application-name "helloworld11" \
  --version-label helloworld11 \
  --source-bundle S3Bucket="elasticbeanstalk-us-east-1-124429370407",S3Key="helloworld11/Dockerrun.aws.json" \
  --auto-create-application

aws elasticbeanstalk update-environment \
  --application-name "helloworld11" \
  --environment-name "helloworld11-dev" \
  --version-label helloworld11
