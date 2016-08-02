//
//  ViewController.h
//  FmdbDemo
//
//  Created by Zorn on 16/8/2.
//  Copyright © 2016年 任大树. All rights reserved.
//

#import <UIKit/UIKit.h>

//设置代理
@protocol AddDataViewControllerDelegate <NSObject>

//必须执行的方法
@required

-(void)changeValueName:(UITextField *)name andNumber:(UITextField *)number andUserID:(UITextField *)userID;

@end

@interface AddDataViewController : UIViewController

//定义一个weak属性的delegate
@property (nonatomic ,weak)id <AddDataViewControllerDelegate>delegate;


@end
