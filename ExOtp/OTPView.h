//
//  OTPView.h
//  ASROtpGenerator
//
//  Created by Abhimanyu  on 05/06/17.
//  Copyright © 2017 Konstant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OtpInput.h"

@protocol FighterTeamOtpDelegate <NSObject>
-(void)otpcharacter:(OtpInput *)textField withInput:(NSString *)str;
@end



@interface OTPView : NSObject<UITextFieldDelegate,ASOTPDelegate>
@property(retain,nonatomic)NSMutableArray *inputs;
@property(retain,nonatomic) UIView  *view;

+ (id)sharedInstance;
-(void)setOnView:(UIView *)view top:(CGFloat )top height:(CGFloat )height inputs:(int )count;
@property(retain,nonatomic) id<FighterTeamOtpDelegate> delegateOtp;

@end
