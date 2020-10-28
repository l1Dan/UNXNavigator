//
//  ViewController02_BackgroundImage.m
//  UINavigationExtensionDemo
//
//  Created by lidan on 2020/10/25.
//

#import "ViewController02_BackgroundImage.h"
#import "UIImage+NavigationBar.h"

@interface ViewController02_BackgroundImage ()

@end

@implementation ViewController02_BackgroundImage

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (UIColor *)ue_barTintColor {
    return [UIColor whiteColor];
}

- (NSDictionary<NSAttributedStringKey,id> *)ue_titleTextAttributes {
    return @{NSForegroundColorAttributeName: [UIColor whiteColor]};
}

- (UIImage *)ue_navigationBarBackgroundImage {
    return UIImage.navigationBarBackgorundImage;
}

@end