#!/bin/bash
cd cgal
rm cgal.cpp
cp makeFastaFromFile.cpp makeFastaFromFile.cpp.orig
mv makeFastaFromFile.cpp.orig cgal.cpp
./cgalScript.sh
rm cgal.cpp
cp "cgal(dependent).cpp" "cgal(dependent).cpp.orig"
mv "cgal(dependent).cpp.orig" cgal.cpp
cp genomeCopy.fasta ../samtools-1.8
cd ..
cd samtools-1.8
wgsim -d 300 -N 3000000 -1 101 -2 101 genomeCopy.fasta frag1Copy.fastq frag2Copy.fastq 
mv frag1Copy.fastq ../cgal
mv frag2Copy.fastq ../cgal
cd ..
cd cgal
./bowtieScript.sh
./cgalScript.sh
