#!/bin/sh

DEF_PATH="$HOME/.local/share/venv/"

if [[ -z $VIRTENVPATH ]]; then
    VIRTENVPATH=$DEF_PATH
fi

function activate() {
    if [[ -d "$VIRTENVPATH/$1" && -a "$VIRTENVPATH/$1/bin/activate" ]]; then
        # deactivate any virtualenvs, if there is any
        while [[ -n $VIRTUAL_ENV ]]; do
            deactivate
        done
        source $VIRTENVPATH/$1/bin/activate
    else
        _err_nodir $VIRTENVPATH/$1
        return 1
    fi
}

function venv() {
    if [[ -d "$VIRTENVPATH/$1" ]] ; then
        if [[ -z $(ls $VIRTENVPATH/$1/) ]] ; then
            virtualenv $VIRTENVPATH/$1
        else
            _err_direxist $VIRTENVPATH/$1
            return 1
        fi
    else
        mkdir -p $VIRTENVPATH/$1
        virtualenv $VIRTENVPATH/$1
    fi
}

function lsvenvs() {
    ls $VIRTENVPATH/
}

function rmvenv() {
    if [[ -z $1 ]] ; then
        echo "Must specify a virtualenv name"
    fi

    while [[ -n $VIRTUAL_ENV ]] ; do
        # Deactivate if virtualenv detected
        deactivate
    done
    
    for env in $*; do
        rm -rf $VIRTENVPATH/$env
    done
}

function _err_nodir() {
    echo "\
        Virtualenv not found! Make sure you have installed the virtualenv $1.
        If not, go to $VIRTENVPATH and do
            mkdir -p $VIRTENVPATH/$1
            virtualenv $VIRTENVPATH/$1
        and use this script after that.
        "
}

function _err_direxist() {
    echo "\
        The directory $1 already exists and is not empty. Please remove it before creating a virtualenv.
        "
}

function _is_invenv() {
    test $VIRTUAL_ENV
    return $?
}
