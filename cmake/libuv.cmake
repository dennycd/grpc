# Copyright 2017 gRPC authors.
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

# TODO(hork): support module and package versions
if(NOT LIBUV_ROOT_DIR)
  set(LIBUV_ROOT_DIR ${CMAKE_CURRENT_SOURCE_DIR}/third_party/libuv)
endif()

add_subdirectory("${LIBUV_ROOT_DIR}" third_party/libuv)
include_directories("${LIBUV_ROOT_DIR}/include")

set(_gRPC_LIBUV_INCLUDE_DIR "${LIBUV_ROOT_DIR}/include")