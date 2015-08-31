all: s_meliloti.fa s_meliloti.gff3 sample.gff3

s_meliloti.fa:
	wget ftp://ftp.ensemblgenomes.org/pub/bacteria/release-28/fasta/bacteria_0_collection/sinorhizobium_meliloti_1021/dna/Sinorhizobium_meliloti_1021.GCA_000006965.1.28.dna.genome.fa.gz
	gunzip Sinorhizobium_meliloti_1021.GCA_000006965.1.28.dna.genome.fa.gz
	mv Sinorhizobium_meliloti_1021.GCA_000006965.1.28.dna.genome.fa $@

s_meliloti.gff3:
	wget ftp://ftp.ensemblgenomes.org/pub/bacteria/release-28/gff3/bacteria_0_collection/sinorhizobium_meliloti_1021/Sinorhizobium_meliloti_1021.GCA_000006965.1.28.chromosome.Chromosome.gff3.gz
	wget ftp://ftp.ensemblgenomes.org/pub/bacteria/release-28/gff3/bacteria_0_collection/sinorhizobium_meliloti_1021/Sinorhizobium_meliloti_1021.GCA_000006965.1.28.chromosome.pSymA.gff3.gz
	wget ftp://ftp.ensemblgenomes.org/pub/bacteria/release-28/gff3/bacteria_0_collection/sinorhizobium_meliloti_1021/Sinorhizobium_meliloti_1021.GCA_000006965.1.28.chromosome.pSymB.gff3.gz
	gunzip Sino*.gff3.gz
	cat Sino*.gff3 > s_meliloti.gff3

sample.gff3: s_meliloti.gff3
	head -n 27 s_meliloti.gff3 > $@
