//
// Copyright 2013 Facebook
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import <SenTestingKit/SenTestingKit.h>

#import "OCEventState.h"
#import "ReporterEvents.h"
#import "TestUtil.h"

@interface OCEventStateTests : SenTestCase
@end

@implementation OCEventStateTests

- (void)testParseEvent
{
  OCEventState *state = [[[OCEventState alloc] initWithReporters: @[]] autorelease];
  STAssertEqualObjects([state reporters], @[], @"Reporters are not equal");

}

- (void)testPublishWithEvent
{
  NSDictionary *event = @{@"ilove": @"jello"};
  OCEventState *state = [[[OCEventState alloc] initWithReporters:@[]] autorelease];
  NSArray *events = [TestUtil getEventsForStates:@[state]
                                       withBlock:^{
                                         [state publishWithEvent:event];
                                       }];
  assertThatInteger([events count], equalToInteger(1));
  assertThat(events[0], equalTo(event));
}

@end
