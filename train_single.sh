#Run with cat training_data | ./train_single.sh MODEL_NAME ....and possible paramters for vw

#Good candidates:
#--passes N   (number of iterations)

#Quadratic features
#-q XY    (create quadritic features by combining the namespaces X and Y)
#
#Cubic features
#--cubic XYZ    (create quadritic features by combining the namespaces X,Y,Z)
#
#
#Ignore namespace
#--ignore X  (ignore all features from namespace X)
#
#
#Regularization
#--l1 <number>
#--l2 <number>
mkdir -p log
mkdir -p cache

MODEL_OUT_NAME=$1
shift #now $1 is removed and all other parameters go to vw
CACHE_FILE="cache/$(basename $MODEL_OUT_NAME)"


rm -f $CACHE_FILE #These need to be deleted (experience)
CMD="vw --cache_file $CACHE_FILE --passes 15 -b 26 --progress 1000 --initial_t 1.0 --save_resume --save_per_pass"

cat | $CMD -f $MODEL_OUT_NAME $* > log/single_train.log 2>&1

