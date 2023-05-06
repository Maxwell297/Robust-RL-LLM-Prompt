#!/bin/bash
#SBATCH --job-name=text_style_transfer
#SBATCH --output=text_style_transfer.out.%j
#SBATCH --error=text_style_transfer.out.%j
#SBATCH --time=00:10:00
#SBATCH --qos=default
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=10gb
#SBATCH --gres=gpu:1

# conda activate rlprompt

# Training Prompts for Style Transfer

# python run_tst.py \
#     dataset=[yelp, shakespeare] \
#     dataset_seed=[0, 1, 2 (optional, skip for yelp)] \
#     direction=[0_to_1, 1_to_0] \
#     prompt_length=[any integer (optional, default:5)] \
#     task_lm=[distilgpt2, gpt2, gpt2-medium, gpt2-large, gpt2-xl] \
#     lower_outputs=[true, false] \
#     random_seed=[any integer (optional)]

# python run_tst.py \
#     dataset=yelp \
#     direction=0_to_1 \
#     prompt_length=5 \
#     task_lm=distilgpt2 \
#     lower_outputs=true

# Evaluation

cd evaluation

# python run_eval.py \
#     dataset=[yelp, shakespeare] \
#     dataset_seed=[0, 1, 2 (skip for yelp)] \
#     task_lm=[distilgpt2, gpt2, gpt2-medium, gpt2-large, gpt2-xl] \
#     prompt_0_to_1=[learned prompt for the 0_to_1 direction (optional)] \
#     prompt_1_to_0=[learned prompt for the 1_to_0 direction (optional)]

python run_eval.py \
    dataset=yelp \
    task_lm=distilgpt2 \
    prompt_0_to_1="CommonExamplesSenate Similar comparable" \
    prompt_1_to_0="AlertSource mentioning Besidesadays" 