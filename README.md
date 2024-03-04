# RankSurvey

Run "python -m pip install -r requirements.txt" to install required libraries.
Run "train_glue.sh" to start training.

---- ARGUMENTS ----
-m : model name (default: bert-base-uncased)
-t : task name #{cola,mnli,mrpc,qnli,qqp,rte,sst2,stsb,wnli} (default: mnli)
-n : no. of epochs (default: 8)
-r : prune ratio #No of reduced params / No of original params (default: .1)
-d : decomposition type #{fwsvd,svd,qr} (default: fwsvd)
-l : apply LoSparse #boolean (default: True)

Example: train_glue.sh -m bert-base-uncased -t mnli -n 8 -r .1 -d fwsvd -l 1
