#!/bin/bash


## -- Write the DAS query here
QUERY="dataset=/DoubleMuon/Run201*-02Apr2020-v*/NANOAOD"
#QUERY="dataset=/SingleMuon/Run201*-02Apr2020-v*/NANOAOD"



## -- Write JSON analyer -- PANDAS must be installed
if [ ! -f "read_json.py" ]
then
cat << EOF > "read_json.py"
import pandas as pd

idx_list = ['name','num_lumi','num_file','nevents','nlumis','nfiles','nblocks','size']
df = pd.read_json('temp.json')


data_room={}
target = df.loc[1]['dataset'][0]
for idx in idx_list:
    sets=(idx,target[idx])

    if idx == "size":
        target[idx] = target[idx] * 1e-9
    data_room[idx] = target[idx]


print(data_room)
EOF
fi


## Run DAS Query
file_list=`dasgoclient --query=$QUERY`
cnt=1
for f in $file_list
do
echo $cnt , $f
dasgoclient --query=$f --json > temp.json
python read_json.py
rm temp.json

cnt=$(($cnt+1))
done



