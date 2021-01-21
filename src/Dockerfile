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

ARG FROM_IMAGE=${FROM_IMAGE}
FROM ${FROM_IMAGE}

RUN apt-get update \
    &&  apt-get \
            install \
            --yes \
            vim \
            tree \
            git \
            icdiff \
            openssh-client \
            python3 \
    &&  echo "PS1='\${debian_chroot:+(\$debian_chroot)}\\[\\033[0;37m\\]\\u@\\[\\033[01;31m\\]\\h\\[\\033[01;00m\\]: \\w\\[\\033[00m\\] \\[\\033[01;31m\\]\\\$\\[\\033[00m\\] '" >> /root/.bashrc

CMD ["/bin/bash"]
