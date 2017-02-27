//
//  WKAlertView.m
//  7dmallStore
//
//  Created by celink on 15/6/30.
//  Copyright (c) 2015年 celink. All rights reserved.
//

#import "WKAlertView.h"
#import "AppDelegate.h"
#import <objc/runtime.h>

#define AppDelegateInstance	 ([UIApplication sharedApplication].delegate)


@interface WKAlertView ()

@property(nonatomic, strong)CommitBlock tempBlock;
@property(nonatomic, strong)UIAlertController* tempAlert;

@end

@implementation WKAlertView
{
    __weak UIViewController* tempVC;
}

static char alertKey;
//自定义 弹出框：
+(void)customAlertWithTitle:(NSString*)title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles clickButton:(CommitBlock)commit
{
    WKAlertView* tempSelf=[[WKAlertView alloc]initWithTitle:title message:message delegate:delegate cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles andClick:commit];
    [tempSelf show];
}
-(void)dealloc{
    DLog(@"alert dealloc");
}
-(instancetype)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles andClick:(CommitBlock)commit{
    
    //回调Block：
    self.tempBlock=commit;
    
    //ios8 用UIAlertController 替换
    _tempAlert=[UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* cancelAction=nil;
    UIAlertAction* otherAction=nil;
    
    tempVC=delegate;
    if (!delegate) {
        tempVC=AppDelegateInstance.window.rootViewController;
    }
    objc_setAssociatedObject(AppDelegateInstance, &alertKey, self, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    @weakify(self);
    if (cancelButtonTitle!=nil){
        
        cancelAction=[UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action)
                      {
                          @strongify(self);
                          if (self.tempBlock)
                          {
                              self.tempBlock(0);
                              objc_setAssociatedObject(AppDelegateInstance, &alertKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                          }
                      }];
        [_tempAlert addAction:cancelAction];
    }
    if (otherButtonTitles!=nil)
    {
        otherAction=[UIAlertAction actionWithTitle:otherButtonTitles style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
                     {
                         @strongify(self);
                         if (self.tempBlock)
                         {
                             self.tempBlock(1);
                             objc_setAssociatedObject(AppDelegateInstance, &alertKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                         }
                     }];
        [_tempAlert addAction:otherAction];
    }
    self=[super init];
    return self;
}
-(void)show{
    
    if (tempVC!=nil)
    {
        [tempVC presentViewController:_tempAlert animated:YES completion:nil];
    }
}



@end
