//
//  ImageGrayScaleTests.m
//  ImageGrayScale-Unit-Tests
//
//  Created by Scyano on 08/02/2018.
//

#import <XCTest/XCTest.h>
#import "UIImage+GrayScale.h"

@interface ImageGrayScaleTests : XCTestCase

@end

@implementation ImageGrayScaleTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    
    [super tearDown];
}

- (void)testExample {
    printf("hello, this is test\n");
    BOOL result = [[[UIImage alloc] init] justForTest];
    XCTAssert(result, "you must add some unit test code here!");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
