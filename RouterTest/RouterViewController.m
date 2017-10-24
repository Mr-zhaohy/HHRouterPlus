//
//  RouterViewController.m
//  RouterTest
//
//  Created by Mr_zhaohy on 2017/10/22.
//  Copyright © 2017年 Mr_zhaohy. All rights reserved.
//

#import "RouterViewController.h"
#import "HHRouter+Plus.h"
@interface RouterViewController ()

@end

@implementation RouterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"model:%@",self.receivedModel);
    NSLog(@"block:%@",self.routerBlock);
    NSLog(@"param:%@",self.params);
    if (self.routerBlock) {
        self.routerBlock(YES, @{@"id":@"123"});
    }
//    self.routerBlock(YES,@{@"param":@"hhh"});
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
