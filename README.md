# Stop ec2 instances using Lambda function

Suppose that you are a developper running ec2 instances for test or an organization that have some servers that aren't used after work hours. You should probably like to stop those resources when they are not in use to save money. 

To do so you have two choices : stopping instances manually or use automation

With AWS Lambda you have the opportunity to use SDKs like python to easily develop applications, deploy code, ...
Combine with Cloudwatch event you can tiggered your code (function) automatically based on event or sceduled jobs.

# Terraform

We use terraform to automate the entire process

Create a module that contain the following files:
- [main.tf](https://github.com/boubakr09/stopEC2/blob/master/main.tf) : In which we create resources
- [variables.tf](https://github.com/boubakr09/stopEC2/blob/master/variables.tf) : Conatain variables
- [outputs.tf](https://github.com/boubakr09/stopEC2/blob/master/outputs.tf) : Return some informations about after resource creation
- [stop_ec2.zip](https://github.com/boubakr09/stopEC2/blob/master/stop_ec2.zip) : Is the package that contain the python script to stop the ec2 instances

Also have an example directory in which we call our module:
- [main.tf](https://github.com/boubakr09/stopEC2/blob/master/example/main.tf)
- [variables.tf](https://github.com/boubakr09/stopEC2/blob/master/example/variables.tf)
- [outputs.tf](https://github.com/boubakr09/stopEC2/blob/master/example/outputs.tf)

To test this, go to the example directory and run:
- terraform init
- terraform plan
- terraform apply
