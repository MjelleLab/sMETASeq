# sMETASeq---command-line

## Purpose :

sMETASeq is an analysis pipeline to detect microbes, including virus, bacteria and other pathogens, from small RNA-seq data. The pipeline will also include steps to generate host small RNA expression profiles. The microbes are detected using the kraken database and the host small RNAs are detected using miRBase and RNACentral, for miRNAs and other small RNAs, respectively. 

Additional resources:

Sneak peek of the paper: https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3525549

##  sMETASeq comamnd line based pipeline 

This tutorial shows step-by-step how to generate a metagenomics and host small RNA count tables from small RNA sequencing data. The output of the pipeline is expression tables that can be further analyzed within a statistical framwork such as [R](https://www.r-project.org/). This command line based pipeline requires installation of several tools in addition to kraken2 and its database. We recommend install these dependencies using conda. Conda can be installed on Mac and Linux as shown below. 


## Install conda: 

Mac:
https://docs.conda.io/projects/conda/en/latest/user-guide/install/macos.html

Linux:
https://docs.conda.io/projects/conda/en/latest/user-guide/install/linux.html

## Install kraken:

`conda install -c bioconda kraken2`

## Install htseq:

`conda install -c bioconda htseq`

## Install bowtie2:

`conda install -c bioconda bowtie2`


## Download pre-compiled kraken2 standard database:

`wget http://havpryd.medisin.ntnu.no/robinm/sMETASeq/kraken2_DB/*`

make a directory called “kraken2_DB” and put all database files there.

## Download and unzip bowtie2 index:

`wget ftp://ftp.ncbi.nlm.nih.gov/genomes/archive/old_genbank/Eukaryotes/vertebrates_mammals/Homo_sapiens/GRCh38/seqs_for_alignment_pipelines/GCA_000001405.15_GRCh38_no_alt_analysis_set.fna.bowtie_index.tar.gz`

`tar -xvzf GCA_000001405.15_GRCh38_no_alt_analysis_set.fna.bowtie_index.tar.gz`

## Download miRbase and RNACentral databases: 

`wget ftp://mirbase.org/pub/mirbase/CURRENT/genomes/hsa.gff3`

`wget ftp://ftp.ebi.ac.uk/pub/databases/RNAcentral/releases/14.0/genome_coordinates/gff3/homo_sapiens.GRCh38.gff3.gz`

`gunzip homo_sapiens.GRCh38.gff3.gz`



