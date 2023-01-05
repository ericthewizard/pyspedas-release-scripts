#!/bin/bash

# Generate a random temporary directory
temp_dir=$(mktemp -d)

# Clone the pyspedas repository to the temporary directory
git clone https://github.com/spedas/pyspedas.git "$temp_dir/pyspedas"

# Navigate to the temporary directory
cd "$temp_dir/pyspedas"

# Build the package
python setup.py sdist bdist_wheel

# Upload the package to PyPI
twine upload dist/*

# Remove the temporary directory
cd ../..
rm -rf "$temp_dir"

