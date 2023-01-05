#!/bin/bash

# Generate a random temporary directory
temp_dir=$(mktemp -d)

# Clone the pyspedas repository to the temporary directory
git clone https://github.com/MAVENSDC/PyTplot.git "$temp_dir/pytplot"

# Navigate to the temporary directory
cd "$temp_dir/pytplot"

git checkout matplotlib-backend

# Build the package
python setup.py sdist bdist_wheel

# Upload the package to PyPI
twine upload dist/*

# Remove the temporary directory
cd ../..
rm -rf "$temp_dir"

