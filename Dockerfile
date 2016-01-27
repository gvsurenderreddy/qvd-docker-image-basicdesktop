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
LABEL description="This is a basic desktop Ubuntu VM image installation for QVD. It includes XFCE, LibreOffice, Thunderbird, Firefox and Evince"

ENV DEBIAN_FRONTEND noninteractive
# packages
RUN echo "deb http://archive.canonical.com/ubuntu trusty partner" > /etc/apt/sources.list.d/partners.list
RUN apt-get update && apt-get install -y \
  perl-qvd-client
RUN apt-get update && apt-get install -y \
  xubuntu-desktop \
  adobe-flashplugin \
  cups \
  curl \
  evince \
  firefox \
  libreoffice \
  thunderbird
# Config
RUN mkdir -p /etc/skel/.config/xfce4/
COPY xfce4/ /etc/skel/.config/xfce4/
COPY vma.conf /etc/qvd/vma.conf
COPY wallpaper-qvd.jpg /usr/share/wallpapers/
COPY qvdstartx.sh /usr/local/bin/qvdstartx.sh
COPY notify.sh /usr/local/bin/notify.sh
COPY poweroff.sh /usr/local/bin/poweroff.sh
COPY XScreenSaver-nogl /etc/X11/app-defaults/XScreenSaver-nogl
RUN chmod 755 /usr/local/bin/qvdstartx.sh /usr/local/bin/notify.sh /usr/local/bin/poweroff.sh
# Cleanup
RUN echo "" > /etc/udev/rules.d/70-persistent-net.rules
RUN apt-get autoremove -y
RUN apt-get clean
