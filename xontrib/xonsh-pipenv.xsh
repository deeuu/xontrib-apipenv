import os

class PipenvActivator():
    def __init__(self):
        self.pipenv_path = None

    def _activate(self):

        if 'VIRTUAL_ENV' in ${...}:

            if $PWD == self.pipenv_path:
                return
            else:
                $(vox deactivate)
                self.pipenv_path = None

        venv_path = $(pipenv --venv).strip()

        venv_root, venv_name = os.path.split(venv_path)

        with ${...}.swap(VIRTUALENV_HOME=venv_root):

            self.pipenv_path = $PWD

            vox activate @(venv_name)


_pa = PipenvActivator()
aliases['vox-activate-pipenv'] = _pa._activate

@events.on_chdir
def _auto_pipenv(olddir, newdir, **kw):
    if $AUTO_PIPENV and os.path.exists(os.path.join(newdir, 'Pipfile')):
        _pa._activate()
