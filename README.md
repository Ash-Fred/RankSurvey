# RankSurvey

To install required libraries, run:

```
python -m pip install -r requirements.txt
```

To start training, run:

```
train_glue.sh
```

## ARGUMENTS

- `-m` : model name (default: `bert-base-uncased`)
- `-t` : task name (choices: {`cola`,`mnli`,`mrpc`,`qnli`,`qqp`,`rte`,`sst2`,`stsb`,`wnli`}, default: `mnli`)
- `-n` : no. of epochs (default: `8`)
- `-r` : prune ratio (No of reduced params / No of original params, default: `.1`)
- `-d` : decomposition type (choices: {fwsvd,svd,qr}, default: `fwsvd`)
- `-l` : apply LoSparse (boolean, default: `True`)

**Example:** 

```
train_glue.sh -m bert-base-uncased -t mnli -n 8 -r .1 -d fwsvd -l 1
```