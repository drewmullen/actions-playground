#!/usr/bin/env bash

# This script will write a comment on the github PR that calls it
content="We have created the following versions:%0A%0Aabc 123 %0A%0Abcd 123"

# content="${content//'%'/'%25'}"
# content="${content//$'\n'/'%0A'}"
# content="${content//$'\r'/'%0D'}"
echo "::set-output name=reverb::$content"
