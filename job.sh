#!/bin/bash
#SBATCH --job-name=test
#SBATCH --output=test.out.%j
#SBATCH --error=test.out.%j
#SBATCH --time=03:00:00
#SBATCH --qos=default
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=5gb

conda activate rlprompt
python test.py