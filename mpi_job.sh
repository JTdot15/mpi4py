#!/bin/bash

# Template for running python script

# nodelist=c[010-017]  #chasis 1
# nodelist=c[018-025]  #chasis 2
# nodelist=c[026-033]  #chasis 3
# nodelist=c[034-041]  #chasis 4
# nodelist=c[042-049]  #chasis 5
# nodelist=c[050-057]  #chasis 6
# nodelist=c[058-065]  #chasis 7
# nodelist=c[066-073]  #chasis 8
# nodelist=c[074-081]  #chasis 9
# nodelist=c[082-089]  #chasis 10
# nodelist=c[090-097]  #chasis 11

#SBATCH --job-name=name

#SBATCH -o ./Report/loopy.%j.out   # Places output files in sub-directory called Report
#SBATCH -e ./Report/loopy.%j.err   # Places error files in sub-directory called Report
                                # Delete the two lines above for both files to stay in current directory

#SBATCH -N 1                    # Number of servers to be used 88
#SBATCH -n 1                  # Total number of cores to be used, there are 16 cores per node.
#SBATCH --time=100-00:30        # time (DD-HH:MM) after which job will be canceled
#SBATCH --time=100-00:30        # time (DD-HH:MM) after which job will be canceled
#SBATCH --partition=normal


# if you wish to specify a set of nodes, remove one comment symbol from the next line
##SBATCH --nodelist=c[010-025]
#SBATCH --mail-type=BEGIN,END   # when to email user about job status
#SBATCH --mail-user=            # email to send to user about job status updates

# Load Python, MPI, and other modules
module load Python/3.11.3-GCCcore-12.3.0
module load mpi4py/3.1.4-gompi-2023a
module load openmpi4/4.1.1
#module load Anaconda3/5.3.0
#module swap mpich openmpi4/4.1.1
# Enter the above line if the error file says a bunch of annoying stuff

# moduel load Python-bundle-PyPI/2023.06-GCCcore-12.3.0

# Runs Python script on current node
# python test2.py

# Runs Python Serially without MPI (multiple applications in parallel)
# srun python test2.py

# Runs Python with MPI (one application running parallel)
time prun python name.py
