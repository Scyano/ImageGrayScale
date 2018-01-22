//
//  ViewController.m
//  GrayByLUV&Average
//
//  Created by su wenjuan on 3/31/16.
//  Copyright © 2016 Scyano. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+GrayScale.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *sourceImage;
@property (weak, nonatomic) IBOutlet UIImageView *effectImage;
@property (weak, nonatomic) IBOutlet UIView *effectBackView;
@property (weak, nonatomic) IBOutlet UIButton *grayScaleBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1];
    _sourceImage.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"sample.jpg" ofType:nil]];
    _effectImage.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1];
    _effectImage.alpha = 0;
    _effectBackView.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1];
    
    [self beautificationButton];
}
- (IBAction)beginGrayScaleImage:(UIButton *)sender {
    if (sender.selected == NO) {
        if (_effectImage.image == nil) {
            _effectImage.alpha = 0;
            _effectImage.image = [_sourceImage.image convertToGrayScale];
        }
        [UIView animateWithDuration:0.5 animations:^{
            _effectImage.alpha = 1;
        }];
    }else {
        [UIView animateWithDuration:0.5 animations:^{
            _effectImage.alpha = 0;
        }];
    }
    sender.selected = !sender.selected;
}
/*美化而已*/
- (void)beautificationButton{
    NSAttributedString *string = [[NSAttributedString alloc] initWithString:@"Grayscale" attributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:0x99 / 256.0 green:0x99 / 256.0 blue:0x33 / 256.0 alpha:1], NSFontAttributeName:[UIFont fontWithName:@"Zapfino" size:14]}];
    [_grayScaleBtn setAttributedTitle:string forState:UIControlStateNormal];
    _grayScaleBtn.backgroundColor = [UIColor whiteColor];
    _grayScaleBtn.layer.cornerRadius = 5.0;
    _grayScaleBtn.layer.borderColor = [UIColor colorWithRed:0x66 / 256.0 green:0x66 / 256.0 blue:0x33 / 256.0 alpha:1].CGColor;
    _grayScaleBtn.layer.borderWidth = 1;
    _grayScaleBtn.layer.masksToBounds = YES;
    
    _sourceImage.layer.cornerRadius = 5;
    _sourceImage.layer.borderColor = [UIColor colorWithRed:0x66 / 256.0 green:0x66 / 256.0 blue:0x33 / 256.0 alpha:1].CGColor;
    _sourceImage.layer.borderWidth = 1;
    _sourceImage.layer.masksToBounds = YES;
    
    _effectImage.layer.cornerRadius = 5;
    _effectImage.layer.borderColor = [UIColor colorWithRed:0x66 / 256.0 green:0x66 / 256.0 blue:0x33 / 256.0 alpha:1].CGColor;
    _effectImage.layer.borderWidth = 1;
    _effectImage.layer.masksToBounds = YES;
    
    _effectBackView.layer.cornerRadius = 5;
    _effectBackView.layer.borderColor = [UIColor colorWithRed:0x66 / 256.0 green:0x66 / 256.0 blue:0x33 / 256.0 alpha:1].CGColor;
    _effectBackView.layer.borderWidth = 1;
    _effectBackView.layer.masksToBounds = YES;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
