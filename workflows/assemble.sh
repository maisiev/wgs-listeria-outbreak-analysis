#!/usr/bin/env bash
set -euo pipefail

mkdir -p results/assemblies

for s in SRR7056247 SRR7056248 SRR7056249 SRR7056250 SRR7056251 \
         SRR7056252 SRR7056253 SRR7056254 SRR7056255 SRR7056256; do

	if [ ! -f data/processed/trimmed/${s}_1.fastq.gz ]; then
		echo "Missing trimmed/${s}_1.fastq.gz, skipping"
	continue
	fi

	echo "Assembling $s with Shovill..."
	shovill \
		--R1 data/processed/trimmed/${s}_1.fastq.gz \
		--R2 data/processed/trimmed/${s}_2.fastq.gz \
		--outdir results/assemblies/${s} \
		--cpus 4

done

echo "All assemblies completed!"

