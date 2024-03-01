# MNLI
# Trained on a single V100 32GB

MODEL_NAME=bert-base-uncased
TASK_NAME=mnli #{cola,mnli,mrpc,qnli,qqp,rte,sst2,stsb,wnli}
NO_EPOCHS=8
PRUNE_RATIO=.1 #No of reduced params / No of original params
DECOM_TYPE="fwsvd" #{svd,fwsvd,qr}


python3 run_glue.py \
--task_name $TASK_NAME \
--model_name_or_path $MODEL_NAME \
--warmup_steps 0 \
--initial_threshold 1 \
--final_threshold 0.15 \
--initial_warmup 0 \
--final_warmup 0 \
--beta1 0.85 \
--per_device_train_batch_size 32 \
--learning_rate 9e-5 \
--num_train_epochs $NO_EPOCHS \
--output_dir output \
--num_warmup_steps 480 \
--low_rank_parameter_ratio $PRUNE_RATIO \
--gradient_accumulation_steps 8 \
--decom_type $DECOM_TYPE \
--fwsvdfile
