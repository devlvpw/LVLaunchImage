//
//  UIImage+LVLaunchImage.m
//  LVLaunchImage
//
//  Created by lvpw on 15/4/6.
//  Copyright (c) 2015年 lvpw. All rights reserved.
//

#import "UIImage+LVLaunchImage.h"

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

@implementation UIImage (LVLaunchImage)

+ (UIImage *)lv_launchImage {
    // search 'UILaunchImages' in documentation
    if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1) {
        // Load resources for iOS 7 or later
        NSArray *imagesDict = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
        for (NSDictionary *dict in imagesDict) {
            if (CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeFromString(dict[@"UILaunchImageSize"]))) {
                return [UIImage imageNamed:dict[@"UILaunchImageName"]];
            }
        }
    }
    // Load resources for iOS 6.1 or earlier
    NSString *launchImageName = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImageFile"];
    // iPad
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        if (UIDeviceOrientationIsPortrait([UIDevice currentDevice].orientation))
            return [UIImage imageNamed:[launchImageName stringByAppendingString:@"-Portrait"]];
        if (UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation))
            return [UIImage imageNamed:[launchImageName stringByAppendingString:@"-Landscape"]];
        // TODO: Portrait (Exclude Status Bar) / Landscape (Exclude Status Bar)
    }
    // iPhone5
    if (iPhone5) {
        return [UIImage imageNamed:[launchImageName stringByAppendingString:@"-568h"]];
    }
    return [UIImage imageNamed:launchImageName];
}

@end
