#!/usr/bin/env bash

# This script will write a comment on the github PR that calls it
line="yo\n
hello"

line= "${line//$'\n'/'%0A'}"

echo "::set-output name=reverb::$line"