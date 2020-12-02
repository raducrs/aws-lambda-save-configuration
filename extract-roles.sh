#! /bin/bash

# Parse arguments
HOME_FOLDER="${1:-roles}"

# Create folder
mkdir -p $HOME_FOLDER

# Get Function definition
echo 'Retriving roles'
ROLES=$(aws iam list-roles)
echo $ROLES
echo $ROLES | jq '.' > $HOME_FOLDER/list-roles.json

ROLES_LIST=$(echo $ROLES | jq -r '.Roles[] .RoleName')

echo -e '# Roles\n' > $HOME_FOLDER/README.md

function save_role {
   ROLENAME=$1
   echo 'Processing '$ROLENAME
   echo -e '## ['$ROLENAME']('$ROLENAME'-get-role.json)\n' >> $HOME_FOLDER/README.md
   
   ROLE=$(aws iam get-role --role-name $ROLENAME)
   echo $ROLE | jq '.' > $HOME_FOLDER/$ROLENAME-get-role.json
   ATTACHED_POLICIES=$(aws iam list-attached-role-policies --role-name $ROLENAME)
   echo $ATTACHED_POLICIES | jq '.' > $HOME_FOLDER/$ROLENAME-list-attached-role-policies.json
   
   
   DESCRIPTION=$(echo $ROLE | jq -r .Role.Description)
   echo -e $DESCRIPTION'\n' >> $HOME_FOLDER/README.md
   
   echo -e '### [Attached policies]('$ROLENAME'-list-attached-role-policies.json): \n\n```'  >> $HOME_FOLDER/README.md
   echo -e $ATTACHED_POLICIES | jq '.' | jq -r '.AttachedPolicies[] | .PolicyName' >> $HOME_FOLDER/README.md
   echo -e '``` \n\n'  >> $HOME_FOLDER/README.md
   
   echo -e '### Assume role: \n\n```'  >> $HOME_FOLDER/README.md
   echo -e $ROLE | jq '.' | jq -r '.Role.AssumeRolePolicyDocument.Statement[].Principal.Service' >> $HOME_FOLDER/README.md
   echo -e '``` \n\n'  >> $HOME_FOLDER/README.md
   
}

for ROLE in $ROLES_LIST
do
   save_role $ROLE
done


