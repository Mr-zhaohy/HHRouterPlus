//
//  HHRouter+Plus.h
//  RouterTest
//
//  Created by Mr_zhaohy on 2017/10/22.
//  Copyright © 2017年 Mr_zhaohy. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import <HHRouter/HHRouter.h>

/**
 router回调

 @param finish 是否成功
 @param param 参数
 */
typedef void(^FinishBlock)(BOOL finish,NSDictionary *param);

@interface HHRouter (Plus)
/**
 获取VC并设置回调

 @param route 规则
 @param block 回调
 @param sender 发送者
 
 @return VC
 */
- (UIViewController *)matchController:(NSString *)route withBlock:(FinishBlock)block sender:(id)sender;
/**
 获取VC并传递数据模型、设置回调

 @param route 规则
 @param model 数据模型
 @param block 回调
 @param sender 发送者
 
 @return VC
 */
- (UIViewController *)matchController:(NSString *)route withModel:(id)model block:(FinishBlock)block sender:(id)sender;
@end

@interface UIViewController (HHRouterPlus)

/**
 回调
 */
@property (nonatomic, strong) FinishBlock routerBlock;
/**
 接收到的数据模型
 */
@property (nonatomic, strong) id receivedModel;
/**
 发送者
 */
@property (nonatomic, strong) id routerSender;

@end
