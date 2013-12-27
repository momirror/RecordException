//
//  HandleException.h
//
//  Created by msp on 13-12-26.
//
//

#import <Foundation/Foundation.h>
#define EXCEPTION @"exceptionMessage"
/*
 用于收集和输出崩溃信息
 */
@interface HandleException : NSObject
+(NSMutableArray*)GetExceptionMessage;
+(void)AddExceptionMessage:(NSDictionary*)pMessageDic;
+(void)NSLogAllExceptionMessage;
@end
