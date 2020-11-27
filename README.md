# aws-lambda-save-configuration
Save AWS Lambda Configuration


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

