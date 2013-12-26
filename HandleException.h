//
//  HandleException.h
//  内存泄漏
//
//  Created by msp on 13-12-26.
//
//

#import <Foundation/Foundation.h>
#define EXCEPTION @"exceptionMessage"

@interface HandleException : NSObject
+(NSMutableArray*)GetExceptionMessage;
+(void)AddExceptionMessage:(NSDictionary*)pMessageDic;
+(void)NSLogAllExceptionMessage;
@end
