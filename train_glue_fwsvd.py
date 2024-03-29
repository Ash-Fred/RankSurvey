string = """
export CUDA_LAUNCH_BLOCKING=1
export NCCL_DEBUG=INFO
export NCCL_P2P_DISABLE=1
export NCCL_IB_DISABLE=1
export TOKENIZERS_PARALLELISM=false
#export CUDA_VISIBLE_DEVICES=1
                    
TASK_NAME={task_name}
SAVE_PREFIX=$TASK_NAME/
                    
accelerate launch --num_cpu_threads_per_process 24 run_fwsvd.py \\
  --model_name_or_path {model_name_or_path} \\
  --task_name $TASK_NAME \\
  --per_device_eval_batch_size 128 \\
  --pad_to_max_length \\
  --max_length 128 \\
  --per_device_train_batch_size 32 \\
  --learning_rate 2e-5 \\
  --output_dir $SAVE_PREFIX/ \\
  --num_train_epochs 3
"""

def tgfwsvd(args):
    return string.format(
        task_name=args.task_name,
        model_name_or_path=args.model_name_or_path,
    )