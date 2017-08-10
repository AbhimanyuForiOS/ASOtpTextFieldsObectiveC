//
//  OtpInput.h
//  ASROtpGenerator
//
//  Created by Abhimanyu  on 05/06/17.
//  Copyright © 2017 Konstant. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ASOTPDelegate <NSObject>
-(void)blankDeleteHit:(int)tag;
@end

@interface OtpInput : UITextField
@property(retain,nonatomic) id<ASOTPDelegate> delegateASOtp;


@end
