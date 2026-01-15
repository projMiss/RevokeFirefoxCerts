#!/bin/bash

SCRIPT_DIR=$(dirname "$0")
CERTS="${SCRIPT_DIR}/certs/*"

#IFS=$'\t\n'
for file in $CERTS
do
  NICKNAME=$(openssl x509 -noout -subject -in "$file" | sed -n '/^subject/s/^.*CN=//p')
  certutil -D -d sql:. -n "$NICKNAME"
  certutil -A -d sql:. -n "$NICKNAME" -i "$file" -t "p,p,p"
done

certutil -L -d sql:.
