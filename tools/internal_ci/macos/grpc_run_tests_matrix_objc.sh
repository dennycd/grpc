#!/bin/bash
# Copyright 2019 The gRPC Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -ex

export PREPARE_BUILD_INSTALL_DEPS_OBJC=true
export RUN_TESTS_FLAGS="-f basictests macos objc opt --internal_ci -j 1 --inner_jobs 4 --bq_result_table aggregate_results --extra_args -r ios-test-.*"

$(dirname $0)/grpc_run_tests_matrix.sh
