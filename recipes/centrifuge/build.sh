#!/bin/bash
export LDFLAGS="-L$PREFIX/lib"
export CPATH=${PREFIX}/include

mkdir -p $PREFIX/bin

make CXX=$CXX RELEASE_FLAGS="$CXXFLAGS"
make install prefix=$PREFIX

2to3 --write --nobackups evaluation/*.py
cp evaluation/{centrifuge_evaluate.py,centrifuge_simulate_reads.py} $PREFIX/bin
