//
//  ViewController.m
//  LVLaunchImage
//
//  Created by lvpw on 15/4/6.
//  Copyright (c) 2015年 lvpw. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+LVLaunchImage.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *launchImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.launchImageView.image = [UIImage lv_launchImage];
}

@end
