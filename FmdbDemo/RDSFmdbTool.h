//
//  ViewController.h
//  FmdbDemo
//
//  Created by Zorn on 16/8/2.
//  Copyright © 2016年 任大树. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"
#import "User.h"
@interface RDSFmdbTool : NSObject

/**
 插入数据
 */
+(BOOL)insertDataWithName:(NSString *)name andNumber:(NSString *)number andUserID:(NSString *)userID;

/**
 删除数据(根据用户ID删除，注意－> 用户ID重叠！当userID==nil的时候会删除表内所有数据)
 */
+ (BOOL)deleteWithUserID:(NSString *)userID;

/**
 查询数据(根据data来查询。当data==nil的时候会查询表内所有数据)
 */
+ (NSArray *)queryData:(NSString *)data;

/**
 修改数据（根据用户ID，修改name and number。注意-> 用户ID重叠）
 */
+ (BOOL)updateWithName:(NSString *)name andNumber:(NSString *)number andUserID:(NSString *)userID;


@end
