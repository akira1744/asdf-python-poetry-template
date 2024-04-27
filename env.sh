#!/bin/bash

echo "python 3.12.2" > ./.tool-versions
echo "poetry 1.7.1" >> ./.tool-versions

asdf install

poetry init

# pyproject.tomlファイルからpython = .*の行を探して、python="3.11.4"に書き換える
sed -i -e 's/^python = .*/python = "3.12.2"/' pyproject.toml

poetry config virtualenvs.in-project true --local

# poetry env use $(which python)

poetry env use $(asdf where python)/bin/python

poetry run python --version

poetry add --group dev black
poetry add --group dev ruff@0.1.9
poetry add wheel
poetry add psycopg2
poetry add ipykernel
poetry add openpyxl
poetry add pandas
poetry add sqlalchemy

poetry install
