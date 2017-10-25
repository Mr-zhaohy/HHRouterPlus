//
//  HHRouter+Plus.m
//  RouterTest
//
//  Created by Mr_zhaohy on 2017/10/22.
//  Copyright © 2017年 Mr_zhaohy. All rights reserved.
//

#import "HHRouter+Plus.h"
#import <objc/runtime.h>

@implementation HHRouter (Plus)
- (UIViewController *)matchController:(NSString *)route withBlock:(FinishBlock)block sender:(id)sender{
    UIViewController *viewController = [self matchController:route];
    if (!viewController){
        static NSString *msg = @"ViewController创建失败，请检查路由规则是否正确或是否注册！";
        if (block) {
            //创建失败则NO
            block(NO,@{@"message":msg});
        }
        else{
            NSLog(@"%@",msg);
        }
    }
    if ([viewController respondsToSelector:@selector(setRouterBlock:)]) {
        [viewController performSelector:@selector(setRouterBlock:)
                             withObject:block];
    }
    if ([viewController respondsToSelector:@selector(setRouterSender:)]) {
        [viewController performSelector:@selector(setRouterSender:)
                             withObject:sender];
    }
    return viewController;
}
-(UIViewController *)matchController:(NSString *)route withModel:(id)model block:(FinishBlock)block sender:(id)sender{
    UIViewController *viewController = [self matchController:route withBlock:block sender:sender];
    if ([viewController respondsToSelector:@selector(setReceivedModel:)]) {
        [viewController performSelector:@selector(setReceivedModel:)
                             withObject:model];
    }
    return viewController;
}
@end

@implementation UIViewController (HHRouterPlus)

static char kAssociatedBlockKey;
static char kAssociatedModelObjectKey;
static char kAssociatedSenderKey;

-(void)setRouterBlock:(FinishBlock)routerBlock{
    //关联对象
    objc_setAssociatedObject(self, &kAssociatedBlockKey, routerBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(FinishBlock)routerBlock{
    //获取
    return objc_getAssociatedObject(self, &kAssociatedBlockKey);
}

-(void)setReceivedModel:(id)receivedModel{
    objc_setAssociatedObject(self, &kAssociatedModelObjectKey, receivedModel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(id)receivedModel{
    return objc_getAssociatedObject(self, &kAssociatedModelObjectKey);
}

-(void)setRouterSender:(id)routerSender{
    objc_setAssociatedObject(self, &kAssociatedSenderKey, routerSender, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(id)routerSender{
    return objc_getAssociatedObject(self, &kAssociatedSenderKey);
}
@end
