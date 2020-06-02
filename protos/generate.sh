#!/bin/bash

../node_modules/protobufjs/bin/pbjs -t static-module -w commonjs -o ../src/models/compiled.js awesome.proto greeter.proto
../node_modules/protobufjs/bin/pbts -o ../src/models/compiled.d.ts ../src/models/compiled.js
