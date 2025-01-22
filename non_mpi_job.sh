#!/bin/bash

# Template for running python script serially without MPI

#SBATCH --job-name=PY
#SBATCH -o PY.%j.out
#SBATCH -e PY.%j.err

#SBATCH -N 1                    # Number of servers to be used 88
#SBATCH -n 1                   # Total number of cores to be used, there are 16 cores per node.

# Load Python version and other modules
module load Python/3.9.5-GCCcore-10.3.0

# Runs Python script on current node only regardless of n
# python test1.py

# Runs Python Serially without MPI (multiple programs in parallel)
srun python cool.py
