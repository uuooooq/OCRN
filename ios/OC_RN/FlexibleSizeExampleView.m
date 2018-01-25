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


@interface FlexibleSizeExampleView ()<RCTBridgeModule>{
    UIImageView *_imgView;
    
    NSMutableArray<UIImage *> *_imageArr;
}

@end


@implementation FlexibleSizeExampleView

RCT_EXPORT_MODULE(FlexibleSizeExampleViewCall);

- (instancetype)initWithFrame:(CGRect)frame
{
  if ((self = [super initWithFrame:frame])) {
      _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 40, 352, 198)];
      
      _imgView.image = [UIImage imageNamed:@"crazyADs_2D_ani_Mobile_704x396/crazyADs_2D ani_Mobile_704x396_00060.png"];
      
      [self addSubview:_imgView];
      
      
      
      // 1.1 实例化可变数组用来 加载所有的图片
      _imageArr = [NSMutableArray array];
      
      for (int i = 0; i<60; i++) {
          
          // 获取图片的名称
          NSString *imageName;
          if(i+1 > 9){
              imageName = [NSString stringWithFormat:@"crazyADs_2D_ani_Mobile_704x396/crazyADs_2D ani_Mobile_704x396_000%d.png", i+1];
          }
          else{
              imageName = [NSString stringWithFormat:@"crazyADs_2D_ani_Mobile_704x396/crazyADs_2D ani_Mobile_704x396_0000%d.png", i+1];
          }
          // 创建UIImage对象
          UIImage *image = [UIImage imageNamed:imageName];
          
          // 加入数组
          [_imageArr addObject:image];
      }
//      // 开始按钮
//      UIButton *imgViewButtonStart = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//      [imgViewButtonStart setFrame:CGRectMake(20, 400, 200, 50)];
//      [imgViewButtonStart setTitle:@"开始动画" forState:UIControlStateNormal];
//      [imgViewButtonStart setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
//      [imgViewButtonStart addTarget:self action:@selector(stratAction) forControlEvents:UIControlEventTouchUpInside];
//      [self addSubview:imgViewButtonStart];
//
//      // 暂停按钮
//      UIButton *imgViewButtonStop = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//      [imgViewButtonStop setFrame:CGRectMake(200, 400, 200, 50)];
//      [imgViewButtonStop setTitle:@"停止动画" forState:UIControlStateNormal];
//      [imgViewButtonStop setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
//      [imgViewButtonStop addTarget:self action:@selector(stopAction) forControlEvents:UIControlEventTouchUpInside];
//      [self addSubview:imgViewButtonStop];
      
      dispatch_async(dispatch_get_main_queue(), ^{
          [self setUserInteractionEnabled:YES];
          [_imgView setUserInteractionEnabled:YES];
          // 设置动画图片
          _imgView.animationImages = _imageArr;
          
          // 设置动画的播放次数
          _imgView.animationRepeatCount = 1;
          
          // 设置播放时长
          // 1秒30帧, 一张图片的时间 = 1/30 = 0.03333 20 * 0.0333
          _imgView.animationDuration = 3.0;
          
          // 开始动画
          [_imgView startAnimating];
          //_imgView.image =
      });
      
  }
  return self;
}

RCT_EXPORT_METHOD(addEvent1:(NSString *)name location:(NSString *)location)
{
    RCTLogInfo(@"Pretending to create an event %@ at %@", name, location);
    //[self stratAction];
}

//- (void)stratAction {
//
//
//
//    dispatch_async(dispatch_get_main_queue(), ^{
//        // 设置动画图片
//        _imgView.animationImages = _imageArr;
//
//        // 设置动画的播放次数
//        _imgView.animationRepeatCount = 1;
//
//        // 设置播放时长
//        // 1秒30帧, 一张图片的时间 = 1/30 = 0.03333 20 * 0.0333
//        _imgView.animationDuration = 3.0;
//
//        // 开始动画
//        [_imgView startAnimating];
//    });
//
//}

@end

