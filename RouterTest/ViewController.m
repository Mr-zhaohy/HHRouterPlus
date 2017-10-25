//
//  ViewController.m
//  RouterTest
//
//  Created by Mr_zhaohy on 2017/10/22.
//  Copyright © 2017年 Mr_zhaohy. All rights reserved.
//

#import "ViewController.h"
#import "HHRouter+Plus.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIViewController * vc = [[HHRouter shared] matchController:@"test" withModel:nil block:^(BOOL finish, NSDictionary *param) {
        NSLog(@"收到回调:%@",param);
    } sender:self];
    if (vc) {
        [self presentViewController:vc animated:YES completion:nil];
    }
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
