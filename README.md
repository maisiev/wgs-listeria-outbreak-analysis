# Bacterial WGS Outbreak Analysis

Self-directed project using public Illumina data from *Listeria monocytogenes* isolates to practise assembly, typing, AMR screening and outbreak clustering.

## Setup

Create the conda environment from the file in `envs/`:

```bash
conda env create -f envs/wgs.yml
conda activate wgs
```

**Apple Silicon (M-series) Macs:** many bioconda tools lack native ARM builds, so build for Intel instead:

```bash
CONDA_SUBDIR=osx-64 conda env create -f envs/wgs.yml
conda activate wgs
conda config --env --set subdir osx-64
```

Then download the AMRFinderPlus database once with `amrfinder -u`.
