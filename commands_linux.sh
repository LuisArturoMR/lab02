#!/bin/bash

# B)
echo Exercise b :

c=0
for i in $( ls -F linux | grep '/$' | cut -d/ -f1 ); do
	files=`ls -lR linux/$i | grep '^-' | wc -l`
	echo \#$i: $files
	echo $c $i $files >> data.dat
	a=`expr $c + 1`
done

echo

# C)
echo Exercise c  :

readme=`find linux -name README* | wc -l`
echo \#Number of README files \in linux: $readme

kconfig=`find linux -name [Kk]config* | wc -l`
echo \#Number of Kconfig files \in linux: $kconfig

kbuild=`find linux -name [Kk]build* | wc -l`
echo \#Number of Kbuild files \in linux: $kbuild

makefile=`find linux -name [Mm]akefile* | wc -l`
echo \#Number of Makefile files \in linux: $makefile

c=`find linux -name *.c | wc -l`
echo \#Number of .c files \in linux: $c

h=`find linux -name *.h | wc -l`
echo \#Number of .h files \in linux: $h

pl=`find linux -name *.pl | wc -l`
echo \#Number of .pl files \in linux: $pl

totalfiles=`ls -lR linux | grep '^-' | wc -l`
echo \#Total number of files: $tfiles

totalfiles=`expr $tfiles - $c - $h - $readme - $kconfig - $kbuild - $makefile - $pl`
echo \#Number of other files \in linux: $tfiles

echo
# D)
echo Exercise d :

mkdir C_FILES
mkdir H_FILES

for file in $(find . -name '*.c' -o -name '*.h')
do
     if [[ $file == *.c ]]; then
        cp $file ./C_FILES
           else
        cp $file ./H_FILES
           fi

done


exit
