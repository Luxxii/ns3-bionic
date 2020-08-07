#!/bin/bash

# This is a script file based on https://github.com/wyllianbs/ns3install .
# It has been modified to download and build the (at the time) newest 
# version of NS3 in a non-interactive manner
#
# Federal University of Santa Catarina - UFSC
# (c) Prof. Wyllian Bezerra da Silva <wyllian.bs@ufsc.br>


export DEBIAN_FRONTEND=noninteractive

echo "Installing all dependencies for Debian-based Distro (via apt)"
sudo apt-get update;
sudo -E apt-get install -y g++ python3 python3-dev pkg-config sqlite3 git python3-setuptools qt5-default mercurial gdb valgrind gir1.2-goocanvas-2.0 python-gi python-gi-cairo python-pygraphviz python3-gi python3-gi-cairo python3-pygraphviz gir1.2-gtk-3.0 ipython ipython3 openmpi-bin openmpi-common openmpi-doc libopenmpi-dev autoconf cvs bzr unrar uncrustify doxygen graphviz imagemagick texlive texlive-extra-utils texlive-latex-extra texlive-font-utils dvipng latexmk python3-sphinx dia  gsl-bin libgsl-dev libgsl23 libgslcblas0 tcpdump sqlite sqlite3 libsqlite3-dev libxml2 libxml2-dev cmake libc6-dev libc6-dev-i386 libclang-6.0-dev llvm-6.0-dev automake python3-pip libgtk-3-dev vtun lxc uml-utilities libboost-signals-dev libboost-filesystem-dev wget
python3 -m pip install --user cxxfilt

# Ns3 Folder
URLfile="https://www.nsnam.org/releases/ns-allinone-3.31.tar.bz2"
file=$(echo "${URLfile##*/}")
NSallinonedir=$(echo "${file%.*.*}");
NSversion=$(echo "${NSallinonedir##*-}"); 
NSdir=ns-$NSversion; 

echo -e "\n::: Downloading the NS3 version: \"$URLfile\"..."; 
wget $URLfile ; 

echo -e "\n::: Extracting file: \"$file\"..."; 
tar xvjf $file ; 

echo -e "\n::: Accessing the path: \"$NSallinonedir\"..."; 
cd $NSallinonedir; 

echo -e "\n::: Building the NS3 [version $NSallinonedir]..."; 
./build.py --enable-examples --enable-tests ; 

echo -e "\n::: Accessing the directory: \"$NSdir\"..."; 
cd $NSdir ; 

echo -e "\n::: Testing processing..."; 
./test.py ; 
