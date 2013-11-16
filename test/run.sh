#!/bin/bash

set -e

#####
# Unit Tests
dart test/test.dart

#####
# Type Analysis

echo
echo "dartanalyzer lib/curry.dart"
dartanalyzer lib/curry.dart
