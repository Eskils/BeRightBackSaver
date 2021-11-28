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

+(CGFloat)taglineFontsize { return 64.0; }
+(CGFloat)subtextFontsize { return 18.0; }

+(NSFont*)taglineFontOfSize: (CGFloat)fontSize {
    return [NSFont systemFontOfSize:fontSize weight: NSFontWeightMedium];
}

+(NSString*)subtextFromUD: (ScreenSaverDefaults*)ud {
    NSString *str = [ud stringForKey: @"SUBTEXT"];
    if (str) { return str; }
    else { return @""; }
}

+(NSFont*)subtextFontOfSize:(CGFloat)fontSize {
    return [NSFont systemFontOfSize:fontSize];
}

+(NSURL*)videoUrlFromBundle:(NSBundle*)bundle {
    return [bundle URLForResource:@"app-covers-apple-outline" withExtension:@"mp4"];
}

@end
