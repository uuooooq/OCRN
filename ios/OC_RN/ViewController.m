//
//  ViewController.m
//  OC_RN
//
//  Created by Wenter.Zhu on 2018/1/8.
//  Copyright © 2018年 Wenter.Zhu. All rights reserved.
//

#import "ViewController.h"
#import <React/RCTRootView.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTLog.h>

@interface ViewController ()<RCTBridgeModule>

@end

@implementation ViewController

RCT_EXPORT_MODULE(NativeMethodsCall);

RCT_EXPORT_METHOD(addEvent:(NSString *)name location:(NSString *)location)
{
    RCTLogInfo(@"Pretending to create an event %@ at %@", name, location);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showRNBtnClick:(id)sender {
    NSLog(@"High Score Button Pressed");
    NSURL *jsCodeLocation = [NSURL
                             URLWithString:@"http://localhost:8081/index.bundle?platform=ios"];//
    RCTRootView *rootView =
    [[RCTRootView alloc] initWithBundleURL : jsCodeLocation
                         moduleName        : @"OCRN"
                         initialProperties :
     @{
       @"scores" : @[
               @{
                   @"name" : @"Alex",
                   @"value": @"42"
                   },
               @{
                   @"name" : @"Joel",
                   @"value": @"10"
                   }
               ]
       }
                          launchOptions    : nil];
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view = rootView;
    [self presentViewController:vc animated:YES completion:nil];
}

@end
