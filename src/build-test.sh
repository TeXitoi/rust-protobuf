#!/bin/sh -ex

where_am_i=$(cd `dirname $0`/..; pwd)
PATH="$where_am_i/target:$PATH"

protoc --rust_out lib proto/shrug.proto
protoc --rust_out lib proto/test_root.proto
protoc --rust_out lib proto/test_nonunique_enum.proto
protoc --rust_out lib proto/test_ident.proto
protoc --rust_out lib proto/test_lite_runtime.proto
protoc --rust_out lib proto/text_format_test_data.proto

cargo test
