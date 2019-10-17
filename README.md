## About

This is a simple wrapper script that activates the python `virtualenv` from a set path `$VIRTENVPATH`.
It tries to use the least dependencies. By now it depends only on the `virtualenv` python library.

## Usage

To install, simply put it under the `<oh_my_zsh_path>/custom/plugins/` path.
Or you can just source it from your rc file.
Similar to the `activate` script in anaconda, it searches for the virtualenv in a certain path and source the activate script. The good thing is just... yeah, you don't need a big monster named anaconda.
    
    ```shell
    activate <venv>
    ```
will activate the virtual environment. The `$PS1` prompt will also change accordingly.
The standard `deactivate` function from the original `virtualenv` package still works normally in deactivating the virtualenv.
    
    ```shell
    venv <venv>
    ```
will create a new virtualenv. If it already exists an error will be thrown.

The script will look for virtualenv from path defined by `$VIRTENVPATH` (you can just do it by adding a line or two in your rc file), otherwise the default will be `~/.local/share/venv/`.

Happy hacking!
