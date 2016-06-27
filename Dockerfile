FROM ubuntu:16.04

RUN apt-get update -qq
RUN apt-get install -qqy vim build-essential pkg-config
RUN apt-get install -qqy python-dev python-setuptools python-pip virtualenv

# Install all complex binary packages required for the science stack but
# not the wrapper packages so that things work smoothly in virtualenv. PyPI
# packages will be installed via pip.
#
# NOTE Find the dependencies by manually inspecting the output of:
#
#   $ apt-cache show python-numpy python-scipy python-matplotlib python-cffi-backend | grep ^Depends:
#
# It would have been nice if there was an apt command like `apt-get build-dep`
# which would only install the dependencies and not the *build* dependencies
# which are a much, much larger list.
#
# Dependencies for python-numpy and python-scipy
RUN apt-get install -qqy libblas3 libc6 liblapack3 libgcc1 libgfortran3 libstdc++6
# Dependencies for python-matplotlib
RUN apt-get install -qqy libfreetype6 libgdk-pixbuf2.0-0 libglib2.0-0 \
                         libgtk2.0-0 libpng12-0 libtcl8.6 libtk8.6
# NOTE For some reasons python-matplotlib does not announce that it needs the
# devel packages for libfreetype and libpng.
RUN apt-get install -qqy libfreetype6-dev libpng12-dev
# Dependencies for python-cffi-backend
RUN apt-get install -qqy libc6 libffi6
# Install dvipng for LaTeX rendering in matplotlib; pulls in texlive
RUN apt-get install -qqy dvipng

# upgrade pip itself
RUN pip install --upgrade pip

# create a virtualenv
ENV SCI_PY_ENV /sci-py-env
RUN virtualenv $SCI_PY_ENV
RUN . $SCI_PY_ENV/bin/activate && pip install numpy scipy matplotlib
