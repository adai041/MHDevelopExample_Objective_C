//
//  CMHTabBarController.m
//  WeChat
//
//  Created by senba on 2017/9/10.
//  Copyright © 2017年 CoderMikeHe. All rights reserved.
//

#import "CMHTabBarController.h"
#import "CMHTabBar.h"
@interface CMHTabBarController ()
/// tabBarController
@property (nonatomic, strong, readwrite) UITabBarController *tabBarController;
@end

@implementation CMHTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBarController = [[UITabBarController alloc] init];
    /// 添加子控制器
    [self.view addSubview:self.tabBarController.view];
    [self addChildViewController:self.tabBarController];
    [self.tabBarController didMoveToParentViewController:self];
    
    // kvc替换系统的tabBar
    CMHTabBar *tabbar = [[CMHTabBar alloc] init];
    //kvc实质是修改了系统的_tabBar
    [self.tabBarController setValue:tabbar forKeyPath:@"tabBar"];
}

#pragma mark - Ovveride
- (BOOL)shouldAutorotate {
    return self.tabBarController.selectedViewController.shouldAutorotate;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return self.tabBarController.selectedViewController.supportedInterfaceOrientations;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return self.tabBarController.selectedViewController.preferredStatusBarStyle;
}

- (BOOL)prefersStatusBarHidden{
    return self.tabBarController.selectedViewController.prefersStatusBarHidden;
}
@end
