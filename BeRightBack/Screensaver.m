//
//  Screensaver.m
//  BeRightBack
//
//  Created by Eskil Sviggum on 26/11/2021.
//

#import "Screensaver.h"

@implementation Screensaver

+(NSColor*)textColor {
    return [NSColor colorWithRed:0.9608 green:0.9608 blue:0.9686 alpha:1];
}

+(NSString*)tagline {
    return @"Be right back.";
}

+(NSFont*)taglineFont {
    return [NSFont systemFontOfSize:64 weight: NSFontWeightMedium];
}

+(NSString*)subtextFromUD: (ScreenSaverDefaults*)ud {
    NSString *str = [ud stringForKey: @"SUBTEXT"];
    if (str) { return str; }
    else { return @""; }
}

+(NSFont*)subtextFont {
    return [NSFont systemFontOfSize:18];
}

+(NSURL*)videoUrlFromBundle:(NSBundle*)bundle {
    return [bundle URLForResource:@"app-covers-apple-outline" withExtension:@"mp4"];
}

@end
