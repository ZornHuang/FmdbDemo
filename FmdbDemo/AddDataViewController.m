//
//  ViewController.h
//  FmdbDemo
//
//  Created by Zorn on 16/8/2.
//  Copyright © 2016年 任大树. All rights reserved.
//
#import "AddDataViewController.h"

@interface AddDataViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *numberTF;
@property (weak, nonatomic) IBOutlet UITextField *userID;


@end

@implementation AddDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    //发送代理
    [self.delegate changeValueName:_nameTF andNumber:_numberTF andUserID:_userID];
    
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
