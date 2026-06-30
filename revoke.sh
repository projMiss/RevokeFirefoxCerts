#!/usr/bin/bash

export PS4='\033[32m\u@\h \033[35m${MSYSTEM} \033[33m\w\n\033[0m\$ '
set -x

SCRIPT_DIR=$(dirname "$0")
CERTS="${SCRIPT_DIR}/certs/*"

#IFS=$'\t\n'
for file in $CERTS
do
  NICKNAME=$(openssl x509 -noout -subject -in "$file" | sed -n '/^subject/s/^.*CN=//p')
  certutil -D -d sql:. -n "$NICKNAME"
  certutil -A -d sql:. -n "$NICKNAME" -i "$file" -t p,p,p
done

certutil -L -d sql:.
