#!/bin/bash

[[ ! -d protos ]] && \
echo "Please execute from the project root directory!" && \
exit 1;

pushd protos

filenames="";

# fetch all the proto files recursively from the current directory
protofiles=`find $PWD -type f -name "*.proto"`;

for file in $protofiles; do
    # exclude google protos from the model
    if [[ "$file" != *"/google/"* ]]; then
        filenames+="${file} ";
    fi
done

popd

mkdir -p src/app/models

# remove the generated js model file and ts declaration file
[ -e src/app/models/openfmb-model.js ] && rm src/app/models/openfmb-model.js
[ -e src/app/models/openfmb-model.d.ts ] && rm src/app/models/openfmb-model.d.ts

# generate the js model file
./node_modules/protobufjs/cli/bin/pbjs -t static-module -w commonjs -o src/app/models/openfmb-model.js $filenames
# generate the ts declaration file
./node_modules/protobufjs/cli/bin/pbts -o src/app/models/openfmb-model.d.ts src/app/models/openfmb-model.js
