import os
import pathlib
from pipenv.project import Project
from pipenv.core import do_where


class PipenvActivator():
    def __init__(self):
        self.pipenv_proj_path = None
        self._activate()

    def _activate(self, adir=None):

        if adir is None:
            adir = $PWD

        adir = pathlib.Path(adir)

        if 'VIRTUAL_ENV' in ${...}:

            if (
                self.pipenv_proj_path and
                self.pipenv_proj_path == adir or
                self.pipenv_proj_path in adir.parents
            ):
                return
            else:
                $(vox deactivate)
                self.pipenv_proj_path = None

        project = Project(chdir=False)

        exists = project.virtualenv_exists

        if not exists:
            return

        venv_path = project.virtualenv_location

        venv_root, venv_name = os.path.split(venv_path)

        with ${...}.swap(VIRTUALENV_HOME=venv_root):

            self.pipenv_proj_path = pathlib.Path(project.pipfile_location).parent

            vox activate @(venv_name)


_pa = PipenvActivator()
aliases['apipenv'] = lambda: _pa._activate()


@events.on_chdir
def _apipenv(olddir, newdir, **kw):

    if 'APIPENV' in ${...} and $APIPENV:
        _pa._activate(newdir)
