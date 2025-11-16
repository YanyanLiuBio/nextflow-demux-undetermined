#!/bin/bash

echo -e "file\tread_count" > count.tsv

while read line; do
    echo "$line"

    reads=$(zcat fastq_from_undetermined/"$line" | paste - - - - | wc -l)

    echo -e "${line}\t${reads}" >> count.tsv

done < file

