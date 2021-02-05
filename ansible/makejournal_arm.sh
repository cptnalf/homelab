#!/bin/bash

echo "sudo apt-get install libsystemd-dev"
echo "go get github.com/elastic/beats"
echo "cd $GOPATH/github.com/elastic/beats/journalbeat"

env GOOS=linux GOARCH=arm GOARM=7 go build -v

