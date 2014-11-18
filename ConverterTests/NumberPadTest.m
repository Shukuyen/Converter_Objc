//
//  NumberPadTest.m
//  Converter
//
//  Created by Cornelius Schiffer on 18.11.14.
//  Copyright (c) 2014 it-agile GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NumberPad.h"

#define MOCKITO_SHORTHAND
#import <OCMockito.h>

#define HC_SHORTHAND
#import <OCHamcrest.h>

@interface NumberPad (Testing)

@property (nonatomic, copy) NSString *currentValue;

@end

@interface NumberPadTest : XCTestCase {
    NumberPad *numberPad;
}
@end

@implementation NumberPadTest

- (void)setUp
{
    [super setUp];
    
    numberPad = [[NumberPad alloc] init];
}

- (id)buttonWithTag:(NSInteger)tag
{
    id button = mock([UIButton class]);
    [given([button tag]) willReturnInteger:tag];
    
    return button;
}


- (void)testNumberPressedIsStoredInCurrentValue
{
    [numberPad buttonTouched:[self buttonWithTag:1]];
    
    assertThat([numberPad currentValue], is(@"1"));
}

- (void)testMultipleNumberPressesAreStoredInCurrentValue
{
    [numberPad buttonTouched:[self buttonWithTag:1]];
    [numberPad buttonTouched:[self buttonWithTag:2]];
    
    assertThat([numberPad currentValue], is(@"12"));
}

- (void)testMaximumOfTenDigits
{
    for (NSInteger i = 0; i < 11; ++i) {
        [numberPad buttonTouched:[self buttonWithTag:1]];
    }

    assertThatInteger([numberPad currentValue].length, equalToInteger(10));
}

@end
