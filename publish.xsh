v = $(rg version setup.py).split("'")[1]
git tag @(v)
git push origin @(v)

pipenv run python setup.py sdist bdist_wheel
pipenv run python -m twine upload dist/*
