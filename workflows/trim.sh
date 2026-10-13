#!/usr/bin/env bash
set -euo pipefail

mkdir -p trimmed fastp_reports

for s in SRR7056247 SRR7056248 SRR7056249 SRR7056250 SRR7056251 \
         SRR7056252 SRR7056253 SRR7056254 SRR7056255 SRR7056256; do
  if [ ! -f data/raw/${s}_1.fastq.gz ]; then
    echo "Missing data/raw/${s}_1.fastq.gz, skipping"
    continue
  fi
  echo "Trimming $s"
  fastp \
    -i data/raw/${s}_1.fastq.gz -I data/raw/${s}_2.fastq.gz \
    -o trimmed/${s}_1.fastq.gz -O trimmed/${s}_2.fastq.gz \
    --cut_right --cut_window_size 4 --cut_mean_quality 20 \
    --length_required 100 \
    --n_base_limit 5 \
    --detect_adapter_for_pe \
    --thread 4 \
    -j fastp_reports/${s}.json -h fastp_reports/${s}.html
done
