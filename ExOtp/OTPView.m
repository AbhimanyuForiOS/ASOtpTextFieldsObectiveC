//
//  OTPView.m
//  ASROtpGenerator
//
//  Created by Abhimanyu  on 05/06/17.
//  Copyright © 2017 Konstant. All rights reserved.
//

#import "OTPView.h"
#import "OtpInput.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
//#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height



@implementation OTPView
@synthesize inputs,view;



+ (id)sharedInstance {
    static OTPView *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    return shared;
}

#pragma mark - set up otp inputs
-(void)setOnView:(UIView *)v top:(CGFloat )top height:(CGFloat )height inputs:(int )count {
    self.view = v;
    
    inputs = [[NSMutableArray alloc]init];
    CGFloat   left  =  0 ;
    CGFloat  width     =   self.view.bounds.size.width/count;
    for (int i = 0; i<count; i++) {
    
        OtpInput * txt = [[OtpInput alloc]init];
        txt.delegate    = self;
        txt.keyboardType = UIKeyboardTypeNumberPad;
        txt.tag         = i;
        txt.frame       = CGRectMake(left, top ,width,height);
        txt.backgroundColor  = [UIColor redColor];
        txt.secureTextEntry = false;
        txt.textAlignment   = NSTextAlignmentCenter;
        
        txt.delegateASOtp = self;
        [view addSubview:txt];
        
        [txt addTarget:self action: @selector(txtChnged:) forControlEvents: UIControlEventEditingChanged];
        left += width;
        [inputs addObject:txt];
    }
}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
 //  textField.text = @"";
}

-(void)txtChnged:(OtpInput *)txtField{
    
    NSString * str = txtField.text;

    if ([str length] == 0) {
        [self.delegateOtp otpcharacter:txtField withInput:str];
        if (txtField.tag == 0){
            [self.view endEditing:false];
            return;
        }
        //go previous
         OtpInput *txtFild =  (OtpInput *)[inputs objectAtIndex:txtField.tag-1];
         [txtFild becomeFirstResponder];

        
    }else if ([str length] == 1){
         [self.delegateOtp otpcharacter:txtField withInput:str];
        if (txtField.tag == inputs.count-1){
            [self.view endEditing:false];
            return;
        }
        //go forward
        OtpInput *txtFild =  (OtpInput *)[inputs objectAtIndex:txtField.tag+1];
        [txtFild becomeFirstResponder];
       

    }
}

#pragma mark :- OTP Delegates
-(void)blankDeleteHit:(int )tag{
    OtpInput *txtFild =  (OtpInput *)[inputs objectAtIndex:tag];
    [self txtChnged:txtFild];

}

-(void)replaceCharacter:(OtpInput *)txtFld str:(NSString *)str{
    txtFld.text = str;
    [self.delegateOtp otpcharacter:txtFld withInput:str];

    if (txtFld.tag == inputs.count-1){
        [self.view endEditing:false];
        return;
    }
    
    OtpInput *txtFild =  (OtpInput *)[inputs objectAtIndex:txtFld.tag+1];
    [txtFild becomeFirstResponder];
}




-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    int length  = ([textField.text length] + string.length ) - range.length;
        if (length >1){
        [self replaceCharacter:[inputs objectAtIndex:textField.tag] str:string];
        return NO;
    }else{
        return YES;
    }
    
}




@end
