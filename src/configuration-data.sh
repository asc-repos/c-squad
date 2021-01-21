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

declare -r base_os_dictro_name="buster"
declare -r dir_build_os_fs="${DIR_BUILD_WRKSP}/bootsrap-os"  # TODO - To mem.

declare -r file_dockerfile="${DIR_ORIGIN}/Dockerfile"

declare -r img_base_folder="buster-base"
declare -r img_base_version="latest"
declare -r img_base="${img_base_folder}:${img_base_version}"

declare -r img_result_folder="f4u"
declare -r img_result_version="latest"
declare -r img_result="${img_result_folder}:${img_result_version}"
