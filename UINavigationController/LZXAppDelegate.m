//
//  LZXAppDelegate.m
//  UINavigationController
//
//  Created by LZXuan on 14-5-15.
//  Copyright (c) 2014年 轩哥. All rights reserved.
//

#import "LZXAppDelegate.h"
#import "FirstViewController.h"

@implementation LZXAppDelegate
- (void)dealloc{
    [_window release];
    [super dealloc];
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    
    //导航控制器:就是来管理多个视图控制器的一个控件
    //一个导航控制器就可以管理多个的
    
    //首先。创建一个视图控制器作为导航控制器的根视图控制器
    FirstViewController *fvc = [[FirstViewController alloc] init];
    //设置导航的根视图控制器
    UINavigationController *navC = [[UINavigationController alloc] initWithRootViewController:fvc];//这里 有+1操作
    [fvc release];//可以release
    
    //最后把导航控制器 作为window的根视图控制器
    self.window.rootViewController = navC;
    [navC release];//这里可以release
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
