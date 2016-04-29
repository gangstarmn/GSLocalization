//
//  GSLocalize.h
//  Z24Global
//
//  Created by Airbook on 04/25/2016.
//  Copyright © 2016 Airbook. All rights reserved.
//

#import <Foundation/Foundation.h>

// some macros (optional, but makes life easy)



#ifndef GSLocalizedString
#define GSLocalizedString(key,name) \
[[GSLocalize getInstance] localizedStringForKey:(key) bundleName:(name)]
#endif

// "language" can be (for american english): "en", "en-US", "english". Analogous for other languages.
#define GSLocalizeSetLanguage(language) [[GSLocalize getInstance] setLanguage:(language)]

@interface GSLocalize : NSObject

#pragma mark - Init;

+ (GSLocalize*) getInstance;

#pragma mark - Set Methods;

- (void) setLanguage:(NSString*) lang;

#pragma mark - Localization;

- (NSString *)localizedStringForKey:(NSString *)key bundleName:(NSString *)bundleName;

@end

