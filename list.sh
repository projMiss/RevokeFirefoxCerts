#!/bin/bash

echo "RevokeFirefoxCerts list"

certutil -L -d sql:.
