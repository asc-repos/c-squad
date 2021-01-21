#!/bin/bash

#
#  Copyright 2007-2021 ASC
#
#  This file is part of F4U. F4U is part of several helpers, assistants
#  and tools for every day beings in containerized environments.
#
#  F4U is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  F4U is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with F4U. If not, see <http://www.gnu.org/licenses/>.
#
##


PS4="+:\$( basename \"${0}\" ):\${LINENO}: "
set -xeu

declare -r dir_this="$( dirname "${0}" )"

source "${dir_this}/configuration-data.sh"


###
##
#


function get_mnt_point_for_path {
    set -eu
    local -r path="${1:-$path_to_file_or_dir}"
    df --output=target "${path}" | tail -n +2
}

function bootsrap_os_fs {
    set -eu
    mkdir -p "${dir_build_os_fs}"
    mount -i -o remount,exec,dev "$(get_mnt_point_for_path "${dir_build_os_fs}" )"
    debootstrap "${base_os_dictro_name}" "${dir_build_os_fs}"
}

function build_image {
    ##
    #   https://docs.docker.com/develop/develop-images/baseimages/
    #

    set -eu
    tar --directory "${dir_build_os_fs}" --create . | docker import - "${img_base}"  # XXX - Tar will do 'cd' into '--directory' and the '.' path is not current in fact, the CWD is from '--directory' in fact.
    export FROM_IMAGE="${img_base}"
    docker \
        build \
        --force-rm=true \
        --build-arg="FROM_IMAGE" \
        --tag "${img_result}" \
        --file "${file_dockerfile}" \
        "$( dirname "${file_dockerfile}" )"
}


function push_image {
    docker push "${img_result}"
}


###
##
#


req_do_bootsrap_os=false
req_do_build=false
req_do_push=false

while [ ${#} -gt 0 ] ; do
    arg_name="${1}"
    case "${arg_name}" in
        --bootsrap)
            req_do_bootsrap_os="true"
            ;;
        --build)
            req_do_build="true"
            ;;
        --push)
            req_do_push="true"
            ;;
        *)
            echo "ERROR:${0}:${LINENO}: Unknown CLI argument '${arg_name}'." >&2
            exit 1
    esac
    shift
done


###
##
#


which debootstrap

if [ "${req_do_bootsrap_os,,}" == "true" ] ; then
    bootsrap_os_fs
fi
if [ "${req_do_build,,}" == "true" ] ; then
    build_image
fi
if [ "${req_do_push,,}" == "true" ] ; then
    push_image
fi


set +x
echo "INFO:$( basename "${0}" ):${LINENO}: Job done."
echo ""
