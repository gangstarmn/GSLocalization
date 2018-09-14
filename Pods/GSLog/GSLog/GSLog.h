//
//  GSLog.h
//  GSLog
//
//  Created by Gantulga on 4/29/16.
//  Copyright © 2016 ZTech LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <ATLog/ATLog.h>

#   define ATLogError(fmt...)       ATPrettyLog(@"\033[fg255,0,0;\033[bg255,255,255; %@ \033[;",ATStringWithFormat(fmt))
#   define ATLogWarning(fmt...)     ATPrettyLog(@"\033[fg255,255,0;\033[bg220,0,0; %@ \033[;",ATStringWithFormat(fmt))
#   define ATLogURL(fmt...)         ATPrettyLog(@"\033[fg0,0,255;\033[bg255,255,255; %@ \033[;",ATStringWithFormat(fmt))
#   define ATLogResponse(fmt...)    ATPrettyLog(@"\033[fg0,0,255;\033[bg255,255,255; %@ \033[;",ATStringWithFormat(fmt))