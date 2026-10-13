# Listeria monocytogenes WGS Outbreak Analysis

Genomic epidemiology and outbreak investigation workflow using short-read whole-genome sequencing (WGS) data (*Listeria monocytogenes* samples SRR7056247–SRR7056256).

## Pipeline Overview
1. **Quality Control & Trimming**: Raw reads assessed with FastQC and trimmed using `fastp` (`workflows/trim.sh`).
2. **De Novo Assembly**: Assemblies generated using `Shovill` (`workflows/assemble.sh`).
3. **Quality Assessment**: Evaluated using `QUAST` and `MultiQC` to check coverage, contig continuity, and GC content.
4. **Contamination Screening**: Identified sample `SRR7056252` as contaminated and excluded it from downstream analysis.

## Repository Structure
* `workflows/`: Pipeline shell scripts for trimming and assembly.
* `data/` & `results/`: Local data and outputs (excluded from version control via `.gitignore`).
