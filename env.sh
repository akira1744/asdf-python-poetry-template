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

poetry add ibis-framework@7.2.0 --extras "duckdb,pandas"
poetry add pandas@1.5.3
poetry add polars@0.19.19
poetry add pyarrow@14.0.2

poetry add wheel
poetry add psycopg2
poetry add ipykernel
poetry add openpyxl

poetry install
