//
// Created by 张寅 on 2018/2/3.
// Copyright (c) 2018 im.com. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RockManager : NSObject

+ (void)config:(NSDictionary *)props;
+ (NSDictionary *)readConfig;
+ (void)onApplication;

@end