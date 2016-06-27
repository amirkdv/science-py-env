Docker Image for Scientific Python
==================================

This is a [virtualenv](http://docs.python-guide.org/en/latest/dev/virtualenvs/)-friendly docker [image](https://hub.docker.com/r/amirkdv/science-py-env/) for testing scientific python code on Ubuntu 16.04. Currently, numpy, scipy, and matplotlib are supported, which means you can say:

```
docker run -it amirkdv/science-py-env -- pip install numpy scipy matplotlib
```

For convenience, a virtual environment is already created in `$SCI_PY_ENV` (default is `/sci-py-env`) where numpy, scipy, and matplotlib are installed.

What is the Problem?
--------------------

All core scientific computing packages for python have system-level dependencies that are not installable entirely from PyPI. This has lead to the creation of platform-dependent packages which include system dependencies in addition to PyPI packages, e.g. for Debian [python-numpy](https://packages.debian.org/python-numpy), [python-scipy](https://packages.debian.org/python-scipy), and [python-matplotlib](https://packages.debian.org/python-matplotlib).  However, since a virtual environment cannot be passed down to the system-level package installer, this solution makes building testing enviroments complicated.

Why not `apt-get build-dep`?
----------------------------

There is an `apt-get` [command](http://linux.die.net/man/8/apt-get) called `build-dep` which comes close to what is needed. The issue with it is that it does not just install the dependent packages but also everything needed for getting a *build* environment for the package (cf.  [docs](https://www.debian.org/doc/debian-policy/ch-relationships.html) on `Depends` and `Build-Depends`). So, if we were to say:

```
apt-get build-dep python-numpy
```

the python package would not get installed (good) but a large list of other system packages would be installed (bad).
