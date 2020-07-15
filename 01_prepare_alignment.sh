#!/bin/bash

module load  mafft/7.294
module load trimal/1.2

# 1st
mafft --auto --reorder --thread 1 01_ITS.fasta > 02_mafft.fasta

# 2nd
trimal -in 02_mafft.fasta -out 02_mafft.trimed.fasta -gappyout -fasta
# rename, remove all characters after "blank"
sed 's/ .*$//g' 02_mafft.trimed.fasta > 02_ITS.fasta

