#!/bin/sh
#

rm -r cov-int
rm tommyds.tgz

make distclean

export PATH=$PATH:../snapraid/contrib/cov-analysis-linux-8.5.0.1/bin

if ! cov-build --dir cov-int make; then
	exit 1
fi

tar czf tommyds.tgz cov-int

rm -r cov-int

echo tommyds.tgz ready to upload to https://scan.coverity.com/projects/3780/builds/new

