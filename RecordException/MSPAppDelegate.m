//
//  MSPAppDelegate.m
//  RecordException
//
//  Created by msp on 13-12-26.
//  Copyright (c) 2013年 ___FULLUSERNAME___. All rights reserved.
//

#import "MSPAppDelegate.h"

#import "MSPViewController.h"

#import "HandleException.h"

@implementation MSPAppDelegate

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

void uncaughtExceptionHandler(NSException *exception)
{

    // 调用堆栈
    NSArray *callStackSymbols = [exception callStackSymbols];
    // 错误reason
    NSString *reason = [exception reason];
    // exception name
    NSString *name = [exception name];
    NSDate * pDate = [NSDate date];
    NSTimeInterval timeZoneOffset = [[NSTimeZone systemTimeZone] secondsFromGMT];
    pDate = [pDate dateByAddingTimeInterval:timeZoneOffset];
    
    
    /*保存异常信息
      根据自己的需求将crash信息记录下来，下次启动的时候传给服务器。
      尽量不要在此处将crash信息上传，因为App将要退出，不保证能够将信息上传至服务器
     */

#ifdef DEBUG
    NSLog(@"异常信息->%@",[NSDictionary dictionaryWithObjectsAndKeys:reason,@"reasion",name,@"name",callStackSymbols,@"callStackSymbols", nil]);
#endif
    
    [HandleException AddExceptionMessage:[NSDictionary dictionaryWithObjectsAndKeys:reason,@"reasion",name,@"name",callStackSymbols,@"callStackSymbols",[pDate description],@"date", nil]];
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
#ifdef DEBUG
    [HandleException NSLogAllExceptionMessage];
#endif

    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.viewController = [[[MSPViewController alloc] initWithNibName:@"MSPViewController" bundle:nil] autorelease];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    NSSetUncaughtExceptionHandler(&uncaughtExceptionHandler);
    
    // 模拟错误信息
    NSArray *array = [NSArray arrayWithObject:@"0"];
    NSLog(@"%@", [array objectAtIndex:1]);
//    UILabel * pLabel = [[UILabel alloc] init];
//    [pLabel release];
//    [pLabel setText:@"test"];
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
