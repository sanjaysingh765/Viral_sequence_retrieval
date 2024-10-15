#!/bin/bash

##########################################################################################################
#
# Can fetch sequence from NCBI in FASTA format/ input should be in bed format
#		OR143135	1111	2286
#		OR143134	1111	2286
#		OR143158	1070	2245
#
######################################################################################################









# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <input_file> <output_file>"
    exit 1
fi

input_file="$1"
output_file="$2"

# Clear the output file if it exists
> "$output_file"


# Clear the output file if it exists
> "$output_file"

while IFS=$'\t' read -r id start stop; do
    # Fetch the sequence and append to the output file
    wget -q -O - "https://www.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nuccore&id=${id}&seq_start=${start}&seq_stop=${stop}&rettype=fasta" >> "$output_file"
done < "$input_file"

