==================================
Docker Image for Scientific Python
==================================

|teststatus|

This repo defines a virtualenv_ friendly docker_ image for testing scientific
python code on Ubuntu 16.04. Currently, numpy, scipy, and matplotlib are
supported, which means you can say:

.. code-block:: sh

   docker run -it amirkdv/science-py -- pip install numpy scipy matplotlib

What is the Problem?
--------------------
All core scientific computing packages for python have system-level dependencies
that are not installable entirely from PyPI. This has lead to the creation of
platform-dependent packages which include system dependencies in
addition to PyPI packages, e.g. for Debian python-numpy_,
python-scipy_, and python-matplotlib_. However, since a virtual environment
cannot be passed down to the system-level package installer, this solution makes
building testing enviroments complicated.

Why not ``apt-get build-dep``?
------------------------------

There is an ``apt-get`` command_ called ``build-dep`` which comes close to what
is needed. The issue with it is that it does not just install the dependent
packages but also everything needed for getting a *build* environment for the
package (cf. docs_ on ``Depends`` and ``Build-Depends``). So, if we were to
say:

.. code-block:: sh

   apt-get build-dep python-numpy

the python package would not get installed (good) but a large list of other
system packages would be installed (bad).

.. _virtualenv: http://docs.python-guide.org/en/latest/dev/virtualenvs/
.. _docker: https://docs.docker.com/
.. _python-numpy: https://packages.debian.org/python-numpy
.. _python-scipy: https://packages.debian.org/python-scipy
.. _python-matplotlib: https://packages.debian.org/python-matplotlib
.. _command: http://linux.die.net/man/8/apt-get
.. _docs: https://www.debian.org/doc/debian-policy/ch-relationships.html

.. |teststatus| image:: https://circleci.com/gh/amirkdv/docker-science-py.svg?style=shield
    :target: https://circleci.com/gh/amirkdv/docker-science-py
