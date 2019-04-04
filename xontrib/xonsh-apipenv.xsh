import os


class PipenvActivator():
    def __init__(self):

        self.pipenv_path = None

        self._activate()

    def _activate(self, adir=None):

        if adir is None:
            adir = $PWD

        pipfile_exists = os.path.exists(os.path.join(adir, 'Pipfile'))

        if 'VIRTUAL_ENV' in ${...}:

            if self.pipenv_path and $PWD.startswith(self.pipenv_path):
                return
            else:
                $(vox deactivate)
                self.pipenv_path = None

        if not pipfile_exists:
            return

        venv_path = $(pipenv --venv).strip()
        if not venv_path:
            print(
                "xonsh-pipenv: "
                "Pipfile found but no virtual environment for this project"
            )
            return

        venv_root, venv_name = os.path.split(venv_path)

        with ${...}.swap(VIRTUALENV_HOME=venv_root):

            self.pipenv_path = $PWD

            vox activate @(venv_name)


_pa = PipenvActivator()
aliases['vox-activate-pipenv'] = lambda: _pa._activate()


@events.on_chdir
def _auto_pipenv(olddir, newdir, **kw):

    if 'AUTO_PIPENV' in ${...} and $AUTO_PIPENV:
        _pa._activate(newdir)
