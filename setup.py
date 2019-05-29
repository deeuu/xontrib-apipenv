from setuptools import setup

setup(
    name='xontrib-apipenv',
    version='0.4.0',
    url='https://github.com/deeuu/xonsh-apipenv',
    license='MIT',
    author='Dominic Ward',
    author_email='dom@deeuu.me',
    description='Auto activate a Pipenv virtual environment',
    packages=['xontrib'],
    package_dir={'xontrib': 'xontrib'},
    package_data={'xontrib': ['*.xsh']},
    platforms='any',
    install_requires=['pipenv>=2018.11.26'],
    classifiers=[
        'Environment :: Console',
        'Intended Audience :: End Users/Desktop',
        'Operating System :: OS Independent',
        'Programming Language :: Python',
        'Topic :: Desktop Environment',
        'Topic :: System :: Shells',
        'Topic :: System :: System Shells',
    ]
)
