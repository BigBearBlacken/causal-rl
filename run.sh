#! /bin/bash
GPU=0

for EXPERT in noisy_good perfect_good perfect_bad random strong_bad_bias strong_good_bias; do
  for SEED in {0..19}; do
    python experiments/toy1/01_train_models.py $EXPERT -s $SEED -g $GPU
    python experiments/toy1/02_eval_models.py $EXPERT -s $SEED -g $GPU
  done
  python experiments/toy1/03_plots.py $EXPERT
done
