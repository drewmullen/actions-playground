#!/usr/bin/env bash

# This script will write a comment on the github PR that calls it
content="We have created the following versions:%0A%0Aabc 123 %0A%0Abcd 123"

echo "::set-output name=reverb::$content"
