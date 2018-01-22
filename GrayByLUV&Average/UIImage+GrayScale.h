//
//  UIImage+GrayScale.h
//  GrayByLUV&Average
//
//  Created by su wenjuan on 3/31/16.
//  Copyright © 2016 Scyano. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (GrayScale)

/**
 *  convert image to gray by RGB
 *
 *  @return return modified image
 */
- (instancetype)convertToGrayScale;

/**
 *  convert jpeg to bitmap to aspectFit
 *
 *  @param image: image with suffix '.jpeg'
 *
 *  @return redrawn image.
 */
- (instancetype)ConvertJpegImage:(UIImage *)image;

@end
