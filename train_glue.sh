#!/bin/bash

while [[ $# -gt 0 ]]; do
  key="$1"

  case $key in
  --task_name|-t)
    TASK_NAME="$2"
    shift
    ;;
  --model_name_or_path|-m)
    MODEL_NAME="$2"
    shift
    ;;
  --num_train_epochs|-n)
    NO_EPOCHS="$2"
    shift
    ;;
  --low_rank_parameter_ratio|-r)
    PRUNE_RATIO="$2"
    shift
    ;;
  --decom_type|-d)
    DECOM_TYPE="$2"
    shift
    ;;
  *) # Unknown option
    echo "Unknown option $key"
    exit 1
    ;;
  esac
  shift # Shift past argument or value
done


python run_glue.py \
--task_name ${TASK_NAME:-mnli} \
--model_name_or_path ${MODEL_NAME:-bert-base-uncased} \
--warmup_steps 0 \
--initial_threshold 1 \
--final_threshold 0.15 \
--initial_warmup 0 \
--final_warmup 0 \
--beta1 0.85 \
--per_device_train_batch_size 32 \
--learning_rate 9e-5 \
--num_train_epochs ${NO_EPOCHS:-'8'} \
--output_dir output \
--num_warmup_steps 480 \
--low_rank_parameter_ratio ${PRUNE_RATIO:-'.1'} \
--gradient_accumulation_steps 8 \
--decom_type ${DECOM_TYPE:-fwsvd} \
-l \
-e \
#-f