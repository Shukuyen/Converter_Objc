//
//  ConverterControllerTest.m
//  Converter
//
//  Created by Cornelius Schiffer on 18.11.14.
//  Copyright (c) 2014 it-agile GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ConverterController.h"
#import "NumberPad.h"

#define MOCKITO_SHORTHAND
#import <OCMockito.h>

#define HC_SHORTHAND
#import <OCHamcrest.h>

@interface ConverterController (Testing)
@property (nonatomic, strong) NumberPad *numberPad;
@property (nonatomic, strong) UILabel *displayLabel;

- (void)buttonTouched:(id)sender;

@end

@interface ConverterControllerTest : XCTestCase {
    ConverterController *converterController;
    NumberPad *numberPad;
    UILabel *displayLabel;
}

@end

@implementation ConverterControllerTest

- (void)setUp
{
    [super setUp];

    converterController = [[ConverterController alloc] init];
    numberPad = mock([NumberPad class]);
    converterController.numberPad = numberPad;
    
    displayLabel = [[UILabel alloc] init];
    converterController.displayLabel = displayLabel;
}

- (id)buttonWithTag:(NSInteger)tag
{
    id button = mock([UIButton class]);
    [given([button tag]) willReturnInteger:tag];
    
    return button;
}

- (void)testControllerHasNumberPad
{
    [converterController viewDidLoad];
    assertThat(converterController.numberPad, isNot(nilValue()));
}

- (void)testButtonTouchIsForwardedToNumberPad
{
    UIButton *button = [self buttonWithTag:1];
    [converterController buttonTouched:button];
    [verify(numberPad) buttonTouched:button];
}

- (void)testValueIsDisplayed
{
    [given([numberPad currentValue]) willReturn:@"42"];
    [converterController buttonTouched:nil];
    assertThat(converterController.displayLabel.text, is(@"42"));
}

@end
