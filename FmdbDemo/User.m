//
//  ViewController.h
//  FmdbDemo
//
//  Created by Zorn on 16/8/2.
//  Copyright © 2016年 任大树. All rights reserved.
//

#import "User.h"

@implementation User
+(instancetype)userWithName:(NSString *)name andNumber:(NSString *)number andUserID:(NSString *)userID{
    User *user = [[User alloc]init];
    user.name=name;
    user.number=number;
    user.userID=userID;
  
    return user;
}
@end
