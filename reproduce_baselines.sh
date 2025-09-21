# # LTSF
# dataset="Weather Electricity ETTh1 ETTh2 ETTm1 ETTm2 Traffic PEMS03 PEMS04 PEMS08"
# dataset="Electricity ETTm2"
# models="SampleGNN"

# input_length="96 336"
# output_length="96" 
# seed="1 2 3 4 5"
# for model in $models; do
# 	for l in $input_length; do
# 		for data in $dataset; do
# 			for s in $seed; do
# 				sed -i "s/INPUT_LEN = .*/INPUT_LEN = $l/" models/$model/$data.py
# 				sed -i "s/OUTPUT_LEN = .*/OUTPUT_LEN = $output_length/" models/$model/$data.py
# 				sed -i "s/CFG.ENV.SEED = .*/CFG.ENV.SEED = $s/" models/$model/$data.py
# 				python experiments/train.py -c models/$model/$data.py -g 0 
# 			done
# 		done
# 	done
# done

# LTSF
dataset="PEMS03 PEMS04 PEMS07 PEMS08"
models="GWNet AGCRN DGCRN D2STGNN MTGNN BigST"

for model in $models; do
	for l in $input_length; do
		for data in $dataset; do
			for s in $seed; do
				sed -i "s/INPUT_LEN = .*/INPUT_LEN = $l/" models/$model/$data.py
				sed -i "s/OUTPUT_LEN = .*/OUTPUT_LEN = $output_length/" models/$model/$data.py
				sed -i "s/CFG.ENV.SEED = .*/CFG.ENV.SEED = $s/" models/$model/$data.py
				python experiments/train.py -c models/$model/$data.py -g 0 
			done
		done
	done
	find checkpoints/ -type f -name "*.pt" | xargs rm -rf
done


# 	for data in $dataset; do
# 		for s in $seed; do
# 			sed -i "s/INPUT_LEN = .*/INPUT_LEN = $l/" baselines/$model/$data.py
# 			sed -i "s/CFG.ENV.SEED = .*/CFG.ENV.SEED = $s/" baselines/$model/$data.py
# 			python experiments/train.py -c baselines/$model/$data.py -g 0 
# 		done
# 	done
# done
