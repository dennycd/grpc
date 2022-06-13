/*
 *
 * Copyright 2019 gRPC authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

#import <GRPCClient/GRPCCall+Tests.h>
#import <GRPCClient/internal_testing/GRPCCall+InternalTests.h>

#import <Cronet/Cronet.h>
#import <GRPCClient/GRPCCall+Cronet.h>

#import "../Common/TestUtils.h"
#import "../ConfigureCronet.h"
#import "PerfTests.h"

// The Protocol Buffers encoding overhead of remote interop server. Acquired
// by experiment. Adjust this when server's proto file changes.
static int32_t kRemoteInteropServerOverhead = 12;

/** Tests in PerfTests.m, sending the RPCs to a remote SSL server. */
@interface PerfTestsCronet : PerfTests
@end

@implementation PerfTestsCronet

+ (void)setUp {
  configureCronet(/*enable_netlog=*/false);
  [GRPCCall useCronetWithEngine:[Cronet getGlobalEngine]];
  GRPCPrintInteropTestServerDebugInfo();

  [super setUp];
}

+ (NSString *)host {
  return GRPCGetLocalInteropTestServerAddressSSL();
}

+ (GRPCTransportID)transport {
  return gGRPCCoreCronetID;
}

- (int32_t)encodingOverhead {
  return kRemoteInteropServerOverhead;  // bytes
}

@end
