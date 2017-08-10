//
//  ViewController.m
//  ExOtp
//
//  Created by Abhimanyu  on 05/06/17.
//  Copyright © 2017 Konstant. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    OTPView * obj =    (OTPView *)[OTPView sharedInstance];
    obj.delegateOtp = self;
    [obj setOnView:self.view top:100 height:30 inputs:2];
    
}

#pragma mark:- [your dynamic values
-(void)otpcharacter:(OtpInput *)textField withInput:(NSString *)str{
    
    NSLog(@"input %@",str);
    NSLog(@"textField number %ld",(long)textField.tag);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
