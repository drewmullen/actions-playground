#!/usr/bin/env bash

# This script will write a comment on the github PR that calls it
content="yo
hello"

content+="%0Ayo!"

content="${content//'%'/'%25'}"
content="${content//$'\n'/'%0A'}"
content="${content//$'\r'/'%0D'}"
echo "::set-output name=reverb::$content"