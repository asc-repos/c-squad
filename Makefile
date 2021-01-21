#!/usr/bin/make -f

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


DIR_ORIGIN = ./src
DIR_BUILD_WRKSP = ./tmp
export DIR_ORIGIN
export DIR_BUILD_WRKSP

all: bootsrap build

bootsrap:
	time bash "${DIR_ORIGIN}/do-it.sh" --bootsrap
build:
	time bash "${DIR_ORIGIN}/do-it.sh" --build
push:
	time bash "${DIR_ORIGIN}/do-it.sh" --push
clean:
	echo "INFO:${0}:pid=${$}: Cleanup not implemented."
