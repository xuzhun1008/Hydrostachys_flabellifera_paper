#!/bin/sh

module load iq-tree

iqtree -s 02_ITS.fasta -bb 1000 -bnni -nt 2 -pre 02_IQTREE -o HM204913,JQ280777,JF977171,JQ280761

# outgroup
# HM204913,JQ280777,JF977171,JQ280761