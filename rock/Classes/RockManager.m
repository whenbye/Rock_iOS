//
// Created by 张寅 on 2018/2/3.
// Copyright (c) 2018 im.com. All rights reserved.
//

#import "RockManager.h"
#import <Bugly/Bugly/Bugly.h>

@interface RockManager()

@property (nonatomic, strong) NSDictionary *rockConfig;

@end

@implementation RockManager

+ (instancetype)sharedInstance {
    static RockManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc]init];
        sharedInstance.rockConfig = @{};
    });
    return sharedInstance;
}

+ (NSDictionary *)readConfig {
    return [RockManager sharedInstance].rockConfig;
}

+ (void)config:(NSDictionary *)props {
    [RockManager sharedInstance].rockConfig = [props copy];
}

+ (void)onApplication {
    [Bugly startWithAppId:[RockManager sharedInstance].rockConfig[@"buglyAppId"]];
}

@end