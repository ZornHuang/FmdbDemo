//
//  ViewController.h
//  FmdbDemo
//
//  Created by Zorn on 16/8/2.
//  Copyright © 2016年 任大树. All rights reserved.
//

#import "RDSFmdbTool.h"

#define SQLite_Name @"Rfmdb.sqlite"
#define TableName @"t_Rfmdb"
@implementation RDSFmdbTool

static  FMDatabase  *_fmdb;

+ (void)initialize{
   //获取数据库文件路径
    NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:SQLite_Name];
    NSLog(@"%@",filePath);
    _fmdb = [FMDatabase databaseWithPath:filePath];
    
    //创表
    [_fmdb open];
    [_fmdb executeUpdate:[NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, number TEXT NOT NULL , userID TEXT NOT NULL)",TableName]];
    
}


#pragma mark -增
+(BOOL)insertDataWithName:(NSString *)name andNumber:(NSString *)number andUserID:(NSString *)userID{
   
    NSString *sql = [NSString stringWithFormat:@"insert into %@ (name,number,userID) values('%@','%@','%@')",TableName,name,number,userID];
   
    return [_fmdb executeUpdate:sql];
}

#pragma mark -删
+(BOOL)deleteWithUserID:(NSString *)userID{
    if (userID == nil) {
        NSString *sql =[NSString stringWithFormat:@"drop table if exists %@",TableName];
        return [_fmdb executeUpdate:sql];
    }
    NSString *sql = [NSString stringWithFormat:@"delete from  %@ where userID = %@",TableName,userID];
    return [_fmdb executeUpdate:sql];
}

#pragma mark -查
+(NSArray *)queryData:(NSString *)data{
    if (data == nil) {
        NSString *sql = [NSString stringWithFormat:@"select *from %@",TableName];
        NSMutableArray *dataArr = [NSMutableArray array];
        FMResultSet *set = [_fmdb executeQuery:sql];
        while ([set next]) {
            NSString *name = [set stringForColumn:@"name"];
            NSString *number = [set stringForColumn:@"number"];
            NSString *userID = [set stringForColumn:@"userID"];
            User *user = [User userWithName:name andNumber:number andUserID:userID];
            [dataArr addObject:user];
        }
        return dataArr;
    }else{
    
   NSString *sql = [NSString stringWithFormat:@"select *from %@ where name like '%%%@%%' or number like '%%%@%%'",TableName,data,data];
        NSMutableArray *dataArr = [NSMutableArray array];
        FMResultSet *set = [_fmdb executeQuery:sql];
        while ([set next]) {
            NSString *name = [set stringForColumn:@"name"];
            NSString *number = [set stringForColumn:@"number"];
            NSString *userID = [set stringForColumn:@"userID"];
            User *user = [User userWithName:name andNumber:number andUserID:userID];
            [dataArr addObject:user];
        }
        return dataArr;
    
    }
}

#pragma mark -改
+ (BOOL)updateWithName:(NSString *)name andNumber:(NSString *)number andUserID:(NSString *)userID{
    NSString *sql = [NSString stringWithFormat:@"update %@ set name = %@, number = %@ where userID = %@",TableName,name,number,userID];
    return [_fmdb executeUpdate:sql];
}

@end
