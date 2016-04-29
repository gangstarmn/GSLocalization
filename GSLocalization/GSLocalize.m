//
//  LocalizeHelper.m
//  Z24Global
//
//  Created by Airbook on 04/25/2016.
//  Copyright © 2016 Airbook. All rights reserved.
//

#import "GSLocalize.h"

static GSLocalize* SingleLocalSystem = nil;

@interface GSLocalize ()
@property (nonatomic, strong) NSMutableDictionary *bundleDictionary;
@property (nonatomic, strong) NSString *currentLanguage;

@end

@implementation GSLocalize

#pragma mark - Init;

+ (GSLocalize*) getInstance {
    // lazy instantiation
    if (SingleLocalSystem == nil) {
        SingleLocalSystem = [[GSLocalize alloc] init];
    }
    return SingleLocalSystem;
}

#pragma mark - Get Methods;

- (NSMutableDictionary *)bundleDictionary {
    if (!_bundleDictionary) {
        _bundleDictionary = [NSMutableDictionary dictionary];
    }
    return _bundleDictionary;
}

- (NSString *)currentLanguage {
    NSString *language = [[NSUserDefaults standardUserDefaults] objectForKey:@"lang"];
    if (!language) {
        NSDictionary *myLangDictionary = @{@"mn":@"OK",@"en":@"OK"};
        NSArray <NSString *> *languageArray = [NSLocale preferredLanguages];
        for (NSString *languageString in languageArray) {
            NSString *languageKey = languageString;
            if ([languageString length] > 2) {
                languageKey = [[languageString substringToIndex:2] lowercaseString];
            }
            NSString *value = [myLangDictionary objectForKey:languageKey];
            if (value) {
                language = languageKey;
                break;
            }
        }
        if (!language) {
            language = @"en";
        }
        [[NSUserDefaults standardUserDefaults] setObject:language forKey:@"lang"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    return language;
}

#pragma mark - Set Methods;

- (void)setCurrentLanguage:(NSString *)currentLanguage {
    [[NSUserDefaults standardUserDefaults] setObject:currentLanguage forKey:@"lang"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void) setLanguage:(NSString*) lang {
    self.currentLanguage = lang;
    NSArray <NSString *> *bundleNameArray = [self.bundleDictionary allKeys];
    [self.bundleDictionary removeAllObjects];
    for (NSString *bundleName in  bundleNameArray) {
        [self addBundle:bundleName];
    }
}

#pragma mark - Localization;

- (NSString *)localizedStringForKey:(NSString *)key bundleName:(NSString *)bundleName {
    NSBundle *bundle = [self.bundleDictionary objectForKey:bundleName];
    if (bundle) {
        return [bundle localizedStringForKey:key value:@"" table:@"ZAccount"];
    }
    else {
        ATLogError(@"no language in This Bundle %@ %@",bundleName, self.currentLanguage);
        return key;
    }
}

- (void)addBundle :(NSString *)bundleName {
    NSBundle *bundle = [self.bundleDictionary objectForKey:bundleName];
    if (bundle == nil) {
        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:bundleName ofType:@"bundle"];
        NSBundle *mainBundle = [NSBundle bundleWithPath:bundlePath];
        NSString *languagePath = [mainBundle pathForResource:self.currentLanguage ofType:@"lproj"];
        
        NSBundle *languageBundle = [NSBundle bundleWithPath:languagePath];
        if (languageBundle) {
            [self.bundleDictionary setObject:languageBundle forKey:bundleName];
        }
        else {
            ATLogError(@"no language in This Bundle %@ %@",bundleName, self.currentLanguage);
        }
    }
}

@end
