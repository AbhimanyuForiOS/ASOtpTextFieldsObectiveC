//
//  OtpInput.m
//  ASROtpGenerator
//
//  Created by Abhimanyu  on 05/06/17.
//  Copyright © 2017 Konstant. All rights reserved.
//

#import "OtpInput.h"

@implementation OtpInput

-(void)deleteBackward{
    [super deleteBackward];

    [self.delegateASOtp blankDeleteHit:(int)self.tag];
    
}





@end
