# Qvd client for IOS
# Copyright (C) 2015  theqvd.com trade mark of Qindel Formacion y Servicios SL
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

FROM theqvd/qvdimageubuntu:minimal
MAINTAINER The QVD <docker@theqvd.com>

LABEL version="1.0"
LABEL description="This is a basic desktop Ubuntu VM image installation for QVD. It includes LibreOffice and a Firefox"

ENV DEBIAN_FRONTEND noninteractive
# packages
RUN echo "deb http://archive.canonical.com/ubuntu trusty partner" > /etc/apt/sources.list.d/partners.list
RUN apt-get update && apt-get install -y libreoffice firefox icedtea-7-plugin adobe-flashplugin

# Cleanup
RUN echo "" > /etc/udev/rules.d/70-persistent-net.rules
RUN apt-get autoremove -y
RUN apt-get clean
