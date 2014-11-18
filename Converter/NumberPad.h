//
//  NumberPad.h
//  Converter
//
//  Created by Cornelius Schiffer on 18.11.14.
//  Copyright (c) 2014 it-agile GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NumberPad : NSObject

- (void)buttonTouched:(id)sender;
- (NSString *)currentValue;

@end
