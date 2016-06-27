#!/bin/sh

virtualenv env
. env/bin/activate

pip install numpy scipy matplotlib

{
cat <<EOF
import numpy, scipy, matplotlib

print('numpy: ', numpy.__version__)
print('scipy: ', scipy.__version__)
print('matplotlib', matplotlib.__version__)
EOF
} | python -

