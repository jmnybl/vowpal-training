function examples {
    zcat $1 | cut -f 2 | perl -pe 's/(^| ).*?\/.*?\// /g' | tr '/|:' '___'  | perl -pe "s/^/$2 |T /"
}

(examples  /usr/share/ParseBank/MT-data/ngrams-mt-data/triarcs.sorted_by_count.txt.gz  1
examples /usr/share/ParseBank/MT-data/ngrams-HSPaakirjoitus/triarcs.sorted_by_count.txt.gz -1) | shuf

