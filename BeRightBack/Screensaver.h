//
//  Screensaver.h
//  BeRightBack
//
//  Created by Eskil Sviggum on 26/11/2021.
//

#import <ScreenSaver/ScreenSaver.h>
#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface Screensaver : NSObject

+(NSColor*)textColor;
+(NSString*)tagline;
+(NSFont*)taglineFont;
+(NSURL*)videoUrlFromBundle:(NSBundle*)bundle;
+(NSString*)subtextFromUD: (ScreenSaverDefaults*)ud;
+(NSFont*)subtextFont;


@end

NS_ASSUME_NONNULL_END
