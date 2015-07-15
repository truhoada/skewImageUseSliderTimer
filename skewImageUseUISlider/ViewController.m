//
//  ViewController.m
//  skewImageUseUISlider
//
//  Created by admin on 7/14/15.
//  Copyright (c) 2015 iOS31. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgMUPear;
@property (weak, nonatomic) IBOutlet UISlider *slider;

@end

@implementation ViewController
NSTimer * _timer;


- (void)viewDidLoad{
    [super viewDidLoad];
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.05
                                              target:self
                                            selector:@selector(onTimer)
                                            userInfo:nil
                                             repeats:YES];
    
}

// Auto control Mode: use Timer auto change slider.value!
- (void)onTimer{
    self.slider.value += 0.01;
    if (self.slider.value ==1) {
        self.slider.value = 0;
    }
    
    CATransform3D t = CATransform3DIdentity;
    t.m34 -= 0.005;
    t = CATransform3DRotate(t, M_PI/ self.slider.value, 0.0, 1.0, 0.0);
    self.imgMUPear.layer.transform = t;
    
}

- (IBAction)btnStopTimer:(id)sender {
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }else {_timer = [NSTimer scheduledTimerWithTimeInterval:0.05
                                                     target:self
                                                   selector:@selector(onTimer)
                                                   userInfo:nil
                                                    repeats:YES];
        
    }
    
    
}

// User control Mode: user change slider.value by Thumb!
- (IBAction)valueSliderChange:(id)sender {
    
    if (self.imgMUPear.layer.anchorPoint.x>0.0) {
        CGPoint position = self.imgMUPear.layer.position;
        position.x -= self.imgMUPear.layer.bounds.size.width / 2.0;
        self.imgMUPear.layer.anchorPoint = CGPointMake(0.0, 0.5);
        self.imgMUPear.layer.position = position;
    }
    
    CATransform3D t = CATransform3DIdentity;
    t.m34 -= 0.005;
    t = CATransform3DRotate(t, M_PI/ self.slider.value, 0.0, 1.0, 0.0);
    self.imgMUPear.layer.transform = t;
    
    
    //        self.imgMUPear.transform = CGAffineTransformMakeRotation(self.slider.value*2*M_PI/self.slider.maximumValue);
    
}

@end

