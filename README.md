# Stop ec2 instances using Lambda function

Suppose that you are a developper running ec2 instances for test or an organization that have some servers that aren't used after work hours. You should probably like to stop those resources when they are not in use and save money. 

To do so you have two choices : stopping instances manually or use automation

With AWS Lambda you have the opportunity to use SDKs like python to easily develop applications, deploy code, ...
Combine with Cloudwatch event you can tiggered your code (function) automatically based on event or sceduled jobs.

# Terraform

We use terraform to automate the entire process

Create a module that contain the following files:
- [main.tf]() : In which we create resources
- [variables.tf]() : Conatain variables
- [outputs.tf]() : Return some informations about after resource creation
- [stop_ec2.zip]() : Is the package that contain the python script to stop the ec2 instances

Also have an example directory in which we call our module:
- [main.tf]()
- [variables.tf]()
- [outputs.tf]()


