#!bin/bash
DESCRIPTORFILE=${1:-schemas.desc}
PROTODIRECTORY=${2:-proto}
/usr/local/bin/protoc -I/usr/local/include -I/workspace/$PROTODIRECTORY --descriptor_set_out=/workspace/$DESCRIPTORFILE --include_imports $(find /workspace/$PROTODIRECTORY -iname "*.proto")