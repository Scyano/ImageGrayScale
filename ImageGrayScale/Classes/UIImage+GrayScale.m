//
//  UIImage+GrayScale.m
//  GrayByLUV&Average
//
//  Created by Scyano on 3/31/16.
//  Copyright © 2016 Scyano. All rights reserved.
//

#import "UIImage+GrayScale.h"

@implementation UIImage (GrayScale)

/*将一副256^3色的 RGB 图像灰度化成256色, 可以大幅度压缩图像体积*/
- (instancetype)convertToGrayScale{
    CGSize size = [self size];
    int width = size.width;
    int height = size.height;
    // 创建图像的像素数组
    uint32_t *pixels = (uint32_t *)malloc(width * height * sizeof(uint32_t));
    // 初始化
    memset(pixels, 0, width * height * sizeof(uint32_t));
    //创建RGB颜色空间
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    //创建画布保存的载体, 尺寸, 每个像素的大小, 每行的大小, 颜色空间, 布局方式
    CGContextRef context = CGBitmapContextCreate(pixels, width, height, 8, width * sizeof(uint32_t), colorSpace, kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Little);
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), [self CGImage]);
    /*
     YUV算法 0.3*R+0.59*G+0.11*b, rgba 分别由低位到高位存储;
     Aveage算法, 取得RGB 平均值后赋值.
    */
    for (int i = 0; i < height; i++) {
        for (int j = 0; j < width; j++) {
            uint8_t *pixel = (uint8_t *)&pixels[i * width + j];
            uint8_t gray = 0.3 * pixel[3] + 0.59 * pixel[2] + 0.11 * pixel[1];  //YUV
            /*uint8_t gray = (pixel[3] + pixel[2] + pixel[1]) / 3;*/  //Average
            pixel[1] = gray;
            pixel[2] = gray;
            pixel[3] = gray;
        }
    }
    //获得图片
    CGImageRef cgImage = CGBitmapContextCreateImage(context);
    //转化成 obj
    UIImage *image = [UIImage imageWithCGImage:cgImage];
    
    CGImageRelease(cgImage);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    free(pixels);
    
    return image;
}
//图片进行长宽转换重绘
- (instancetype)convertJpegImage:(UIImage *)image {
    BOOL tag = image.size.height >= image.size.width;
    NSInteger width;
    NSInteger height;
    if (tag) {  //竖图重绘, 竖屏显示
        width  = image.size.height;
        height = image.size.width;
    }else{      //横图重绘, 横屏显示
        height  = image.size.height;
        width = image.size.width;
    }
    uint32_t *pixels = malloc(width * height * sizeof(uint32_t));
    memset(pixels, 0, width * height * sizeof(uint32_t));
    
    CGContextRef context = CGBitmapContextCreate(pixels, width, height, 8, width * sizeof(uint32_t), CGColorSpaceCreateDeviceRGB(), kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedLast);
    // 获得图片的像素集
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), image.CGImage);
    
    uint32_t *newPixels = malloc(width * height * sizeof(uint32_t));
    memset(newPixels, 0, width * height * sizeof(uint32_t));
    for (int i = 0; i < height; i++) {
        for (int j = 0; j < width; j++) {
            // 像素矩阵顺时针旋转90
            newPixels[(j - 1) * height - i] = pixels[j + (i * width)];
        }
    }
    
    CGContextRef returnContext = CGBitmapContextCreate(newPixels, height,width, 8, height * sizeof(uint32_t), CGColorSpaceCreateDeviceRGB(), kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedLast);
    CGImageRef cgImage = CGBitmapContextCreateImage(returnContext);
    // 旋转后的图片
    UIImage *returnImage = [UIImage imageWithCGImage:cgImage];
    
    CGContextRelease(context);
    CGContextRelease(returnContext);
    free(pixels);
    free(newPixels);
    CGImageRelease(cgImage);
    
    return returnImage;
}
- (BOOL)justForTest {
    return NO;
}
- (BOOL)nextTest {
    return YES;
}
@end
