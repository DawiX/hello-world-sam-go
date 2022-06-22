# Hello World AWS Lambda in GO with SAM

> **_DISCLAIMER:_** This is not a production code, just a mental excercise to learn technologies

The Serverless Application Model Command Line Interface (SAM CLI) is an extension of the AWS CLI that adds functionality for building and testing Lambda applications.

It uses Docker to run your functions in an Amazon Linux environment that matches Lambda. It can also emulate your application's build environment.

To use the SAM CLI, you need the following tools.

* AWS CLI - [Install the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html) and [configure it with your AWS credentials].
* SAM CLI - [Install the SAM CLI](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install.html)
* Golang - [Golang](https://golang.org)
* Docker - [Install Docker community edition](https://hub.docker.com/search/?type=edition&offering=community)

## Build and Deploy

### Terraform

Preferred way to handle infrastructure deployments. There is a 'build.sh' script that will build and package lambda function.

```bash
./build.sh
```

This will create `lambda.zip` in the root directory of the project. Do whatever is needed with it. (e.g. upload to S3 and use Babenko's lambda TF module for deployment...)

### Serverless Application Model

To build and deploy your application with SAM, run the following in your shell:

```bash
sam build
sam deploy --guided
```

The first command will build the source of your application. The second command will package and deploy your application to AWS, with a series of prompts:

* **Stack Name**: The name of the stack to deploy to CloudFormation. This should be unique to your account and region, and a good starting point would be something matching your project name.
* **AWS Region**: The AWS region you want to deploy your app to.
* **Confirm changes before deploy**: If set to yes, any change sets will be shown to you before execution for manual review. If set to no, the AWS SAM CLI will automatically deploy application changes.
* **Allow SAM CLI IAM role creation**: Many AWS SAM templates, including this example, create AWS IAM roles required for the AWS Lambda function(s) included to access AWS services. By default, these are scoped down to minimum required permissions. To deploy an AWS CloudFormation stack which creates or modifies IAM roles, the `CAPABILITY_IAM` value for `capabilities` must be provided. If permission isn't provided through this prompt, to deploy this example you must explicitly pass `--capabilities CAPABILITY_IAM` to the `sam deploy` command.
* **Save arguments to samconfig.toml**: If set to yes, your choices will be saved to a configuration file inside the project, so that in the future you can just re-run `sam deploy` without parameters to deploy changes to your application.

## Local Invocation

```bash
sam build
sam local invoke HelloWorldFunction --event events/event.json -n events/env.json
```

For convenience, there is `run_local.sh` script that can conditionally build the lambda (if you want to apply code changes) and locally invoke with predefined AWS profile and region for integration testing against real AWS infrastructure.
