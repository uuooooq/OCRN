/**
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 *
 */

#import "FlexibleSizeExampleView.h"

#import <React/RCTBridge.h>
#import <React/RCTRootView.h>
#import <React/RCTRootViewDelegate.h>
#import <React/RCTViewManager.h>

#import "AppDelegate.h"

@interface FlexibleSizeExampleViewManager : RCTViewManager

@end

@implementation FlexibleSizeExampleViewManager

RCT_EXPORT_MODULE();

- (UIView *)view
{
  return [[FlexibleSizeExampleView alloc] init];
}

@end


@interface FlexibleSizeExampleView ()

@end


@implementation FlexibleSizeExampleView


- (instancetype)initWithFrame:(CGRect)frame
{
  if ((self = [super initWithFrame:frame])) {
      
  }
  return self;
}

@end

