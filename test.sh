#!/bin/sh

virtualenv env
. env/bin/activate

pip install numpy scipy matplotlib
python -c 'import numpy, scipy, matplotlib'"
