//
//  HandleException.m
//
//  Created by msp on 13-12-26.
//
//

#import "HandleException.h"

@implementation HandleException
+ (void)AddExceptionMessage:(NSDictionary *)pMessageDic
{
    NSMutableArray * pExceptions = [[[NSUserDefaults standardUserDefaults] valueForKey:EXCEPTION] retain];
    if(pExceptions == nil)
    {
        pExceptions = [[NSMutableArray alloc] init];
    }
    [pExceptions addObject:pMessageDic];
    
    [[NSUserDefaults standardUserDefaults] setValue:pExceptions forKey:EXCEPTION];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [pExceptions release];
    
}

+ (NSMutableArray*)GetExceptionMessage{
    return [[NSUserDefaults standardUserDefaults] valueForKey:EXCEPTION];
}

+ (void)NSLogAllExceptionMessage
{
    NSLog(@"Exception message->%@",[HandleException GetExceptionMessage]);
}

@end
