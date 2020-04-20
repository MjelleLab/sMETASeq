mapfile -s 1 -t files < files.txt
echo "${files[@]}"

for FILE in ${files[@]}; do

	cutadapt  -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCAC -m 1 -o $FILE.cut.fastq $FILE.fastq.gz
	bowtie2 -p10 -k10 -x GCA_000001405.15_GRCh38_no_alt_analysis_set.fna.bowtie_index -q $FILE.cut_trimmed.fastq --un $FILE.Unmapped.cut.fastq -S $FILE.mapped.cut.sam
	htseq-count -i Name -t transcript $FILE.mapped.cut.sam homo_sapiens.chr.GRCh38.chr.gff3 > $FILE.RNACentral.csv
	htseq-count -i Name -t miRNA $FILE.mapped.cut.sam hsa.gff3 > $FILE.miRBase.csv
	sed -n '1~4s/^@/>/p;2~4p' $FILE.Unmapped.cut.fastq > $FILE.Unmapped.cut.fasta
	kraken2 --db ./kraken2_DB --threads 16   --report $FILE.kraken_report.csv --use-mpa-style --output $FILE.kraken_mpa.csv $FILE.Unmapped.cut.fasta;
done

