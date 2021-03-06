# aws-lambda-save-configuration
Save AWS Lambda Configuration and **Code**

Save AWS Roles and policies

## Prerequisites

- aws cli
- jq
- wget or curl
- unzip

## Usage

```
extract-lambda.sh <function-name> <output-folder>
```

## Output

It creates the folder `<output-folder>/<function-name>` with the following content

- `get-function-configuration.json` - output of `aws lambda get-function-configuration`
- `get-function.json`  - output of `aws lambda get-function`
- `get-policy.json` - output of `aws lambda get-policy`
- `policy.json` - JSON parsed Policy
- `README.md` - with function name, description, runtime, timeout, memory, handler, role and additional policies

And the code of the function. **It does not save layers**


### Example README
---

# TI-AUser-ConfirmationGet




Runtime: `nodejs12.x` 

Timeout(s): 3  

Memory(Mb): 128 

Handler: `index.handler` 

Role: `​TI-LambdaReadWriteDB`

Additional policies: 

```
{
  "service": "apigateway.amazonaws.com",
  "action": "lambda:InvokeFunction"
}
{
  "service": "apigateway.amazonaws.com",
  "action": "lambda:InvokeFunction"
}
``` 


**Autogenerated**

## Prerequisites

- aws cli
- jq

## Usage

```
extract-roles.sh
```

## Output

It creates the folder `roles` with the following content
AWSServiceRoleForAPIGateway-get-role.json                                       
AWSServiceRoleForAPIGateway-list-attached-role-policies.json
- `list-roles.json` - output of `aws list-roles`
- `<role-name>-get-role.json` - output of `aws lambda get-role`
- `<role-name>-list-attached-role-policies.json`  - output of `aws lambda list-attached-role-policies`
- `README.md` - with roles, description, policies and assumed roles (services)


### Example README
---

## [AWSServiceRoleForAmazonCognitoIdpEmailService](AWSServiceRoleForAmazonCognitoIdpEmailService-get-role.json)

Service linked role for Amazon Cognito User Pools service to send emails on your behalf

### [Attached policies](AWSServiceRoleForAmazonCognitoIdpEmailService-list-attached-role-policies.json): 

```
AmazonCognitoIdpEmailServiceRolePolicy
``` 


### Assume role: 

```
email.cognito-idp.amazonaws.com
``` 


**Autogenerated**
