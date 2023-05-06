#!/bin/bash
#SBATCH --job-name=rlprompt
#SBATCH --output=rlprompt.out.%j
#SBATCH --error=rlprompt.out.%j
#SBATCH --time=00:05:00
#SBATCH --qos=default
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=20gb
#SBATCH --gres=gpu:2

conda activate rlprompt
CUDA_VISIBLE_DEVICES=0,1 python run_fsc.py dataset=sst-2 dataset_seed=0 prompt_length=5 task_lm=roberta-large
# cd evaluation
# python run_eval.py dataset=agnews task_lm=roberta-large prompt="Alert Blog Dialogue Diary Accountability"