//
//  NumberPad.m
//  Converter
//
//  Created by Cornelius Schiffer on 18.11.14.
//  Copyright (c) 2014 it-agile GmbH. All rights reserved.
//

#import "NumberPad.h"


@interface NumberPad()

@property (nonatomic, copy) NSString *currentValue;

@end

@implementation NumberPad

- (void)buttonTouched:(id)sender
{
    if (_currentValue.length < 10) {
        
        NSString *previousValue = !_currentValue || [_currentValue hasPrefix:@"0"] ? @"" : _currentValue;
        _currentValue = [NSString stringWithFormat:@"%@%ld", previousValue , (long)[sender tag]];
    }
}

@end
