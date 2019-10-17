* About

    This is a simple script that activates the python `virtualenv` from a set path `$VIRTENVPATH`.
    It tries to use the least dependencies. By now it depends only on the `virtualenv` python library.

* Usage

    Similar to the `activate` script in anaconda, it searches for the virtualenv in a certain path and source the activate script.
    ```shell
    activate <venv>
    ```
    will activate the virtual environment. The `$PS1` prompt will also change accordingly.
    The standard `deactivate` function from the original `virtualenv` package still works normally in deactivating the virtualenv.

    The script will look for virtualenv from path defined by `$VIRTENVPATH`,
    otherwise the default will be `~/.local/share/venv/`
