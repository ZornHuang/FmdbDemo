//
//  ViewController.h
//  FmdbDemo
//
//  Created by Zorn on 16/8/2.
//  Copyright © 2016年 任大树. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
/**	
 姓名
 */
@property (nonatomic,copy) NSString *name;

/**	
 电话
 */
@property (nonatomic,copy) NSString *number;

/**	
 userID
 */
@property (nonatomic,copy) NSString *userID;

//自定义初始化方法
+(instancetype)userWithName:(NSString *)name andNumber:(NSString *)number andUserID:(NSString *)userID;



@end
