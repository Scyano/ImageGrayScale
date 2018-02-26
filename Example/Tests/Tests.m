//
//  ImageGrayScaleTests.m
//  ImageGrayScaleTests
//
//  Created by Scyano on 02/26/2018.
//  Copyright (c) 2018 Scyano. All rights reserved.
//

@import XCTest;
@import ImageGrayScale;

@interface Tests : XCTestCase

@end

@implementation Tests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    UIImage *image = [[UIImage alloc] init];
    XCTAssert(image.justForTest, "this is just a failure test");
}

@end

