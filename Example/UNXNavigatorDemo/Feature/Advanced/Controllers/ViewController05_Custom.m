//
//  ViewController05_Custom.m
//  UNXNavigatorDemo
//
//  Created by Leo Lee on 2020/10/26.
//

#import <UNXNavigator/UNXNavigator.h>

#import "ViewController05_Custom.h"
#import "ViewController12_Modal.h"
#import "UIImage+NavigationBar.h"

#import "UIColor+RandomColor.h"
#import "UIDevice+Additions.h"

@interface ViewController05_Custom ()

@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) UIButton *addButton;

@property (nonatomic, strong) NSLayoutConstraint *leftConstraint;
@property (nonatomic, strong) NSLayoutConstraint *rightConstraint;

@end

@implementation ViewController05_Custom

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = nil;
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    
    [self.unx_navigationBar addContainerSubview:self.searchBar];
    [self.unx_navigationBar addContainerSubview:self.backButton];
    [self.unx_navigationBar addContainerSubview:self.addButton];
    
    UIView *containerView = self.unx_navigationBar.containerView;
    self.backButton.hidden = !UIDevice.isPhoneDevice;
    self.leftConstraint = [self.backButton.leftAnchor constraintEqualToAnchor:containerView.leftAnchor];
    self.leftConstraint.active = YES;
    
    [self.backButton.heightAnchor constraintEqualToAnchor:self.searchBar.heightAnchor].active = YES;
    [self.backButton.centerYAnchor constraintEqualToAnchor:self.searchBar.centerYAnchor].active = YES;
    [self.backButton.widthAnchor constraintEqualToConstant:UIDevice.isPhoneDevice ? 44.0 : 0].active = YES;
    
    [self.searchBar.topAnchor constraintEqualToAnchor:containerView.topAnchor constant:2.0].active = YES;
    [self.searchBar.bottomAnchor constraintEqualToAnchor:containerView.bottomAnchor constant:-2.0].active = YES;
    [self.searchBar.leftAnchor constraintEqualToAnchor:self.backButton.rightAnchor constant:8.0].active = YES;
    [self.searchBar.rightAnchor constraintEqualToAnchor:self.addButton.leftAnchor constant:-8.0].active = YES;
    
    self.rightConstraint = [self.addButton.rightAnchor constraintEqualToAnchor:containerView.rightAnchor];
    self.rightConstraint.active = YES;
    
    [self.addButton.heightAnchor constraintEqualToAnchor:self.searchBar.heightAnchor].active = YES;
    [self.addButton.centerYAnchor constraintEqualToAnchor:self.searchBar.centerYAnchor].active = YES;
    [self.addButton.widthAnchor constraintEqualToConstant:44].active = YES;
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    UIEdgeInsets safeAreaInsets = self.navigationController.navigationBar.safeAreaInsets;
    self.leftConstraint.constant = safeAreaInsets.left;
    self.rightConstraint.constant = -safeAreaInsets.right;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (UIColor *)unx_barTintColor {
    return [UIColor clearColor];
}

- (UIImage *)unx_navigationBarBackgroundImage {
    return UIImage.navigationBarBackgorundImage;
}

// 点击导航栏控件事件可以由 ContainerView 响应
- (BOOL)unx_containerViewWithoutNavigtionBar {
    return YES;
}

#pragma mark - Getter

- (UISearchBar *)searchBar {
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc] initWithFrame:CGRectZero];
        _searchBar.backgroundColor = [UIColor clearColor];
        _searchBar.backgroundImage = [[UIImage alloc] init];
        _searchBar.tintColor = [UIColor systemGrayColor];
        _searchBar.translatesAutoresizingMaskIntoConstraints = NO;
        _searchBar.placeholder = @"请输入关键字";
    }
    return _searchBar;
}

- (UIButton *)backButton {
    if (!_backButton) {
        _backButton = [[UIButton alloc] init];
        _backButton.translatesAutoresizingMaskIntoConstraints = NO;
        _backButton.layer.cornerRadius = 8.0;
        _backButton.backgroundColor = [UIColor customColorWithLightModeColor:^UIColor * _Nonnull{
            return [[UIColor whiteColor] colorWithAlphaComponent:0.5];
        } darkModeColor:^UIColor * _Nonnull{
            return [[UIColor whiteColor] colorWithAlphaComponent:0.25];
        }];
        [_backButton setImage:[UIImage imageNamed:@"NavigationBarBack"] forState:UIControlStateNormal];
        [_backButton addTarget:self.navigationController action:@selector(unx_triggerSystemBackButtonHandler) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backButton;
}

- (UIButton *)addButton {
    if (!_addButton) {
        _addButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _addButton.translatesAutoresizingMaskIntoConstraints = NO;
        _addButton.layer.cornerRadius = 8.0;
        _addButton.backgroundColor = [UIColor customColorWithLightModeColor:^UIColor * _Nonnull{
            return [[UIColor whiteColor] colorWithAlphaComponent:0.5];
        } darkModeColor:^UIColor * _Nonnull{
            return [[UIColor whiteColor] colorWithAlphaComponent:0.25];
        }];
        [_addButton setImage:[UIImage imageNamed:@"NavigationBarAdd"] forState:UIControlStateNormal];
        [_addButton addTarget:self action:@selector(clickAddButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addButton;
}

#pragma mark - Action
- (void)clickAddButton:(UIButton *)button {
    UINavigationController *controller = [[[self.navigationController class] alloc] initWithRootViewController:[[ViewController12_Modal alloc] init]];
    [self presentViewController:controller animated:YES completion:NULL];
}

@end