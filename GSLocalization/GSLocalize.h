//
//  GSLocalize.h
//  GSLocalize
//
//  Created by Gantulga on 04/29/2016.
//  Copyright © 2016 ZTech. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef GSLocalizedString
#define GSLocalizedString(key,name) \
[[GSLocalize getInstance] localizedStringForKey:(key) bundleName:(name)]
#endif

// "language" can be (for american english): "en", "en-US", "english". Analogous for other languages.
#define GSLocalizeSetLanguage(language) [[GSLocalize getInstance] setLanguage:(language)]
#define GSLocalizeAddBundle(bundleName) [[GSLocalize getInstance] addBundle:(bundleName)]

@interface GSLocalize : NSObject

#pragma mark - Init;

+ (GSLocalize*) getInstance;

#pragma mark - Set Methods;

- (void) setLanguage:(NSString*) lang;

#pragma mark - Localization;

- (NSString *)localizedStringForKey:(NSString *)key bundleName:(NSString *)bundleName;

- (void)addBundle :(NSString *)bundleName;

@end

