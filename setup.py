from setuptools import setup

setup(
    name='xontrib-xonsh-pipenv',
    version='0.1.1',
    url='https://github.com/deeuu/xonsh-pipenv',
    license='MIT',
    author='Dominic Ward',
    author_email='dom@deeuu.me',
    description='Auto activate a Pipenv virtual environment',
    packages=['xontrib'],
    package_dir={'xontrib': 'xontrib'},
    package_data={'xontrib': ['*.xsh']},
    platforms='any',
)
