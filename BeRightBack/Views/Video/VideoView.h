//
//  VideoView.h
//  BeRightBack
//
//  Created by Eskil Sviggum on 26/11/2021.
//

#import "Screensaver.h"
#import <Cocoa/Cocoa.h>
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VideoView : NSView

-(instancetype)initWithVideoURL:(NSURL*)videoURL andDefaults:(ScreenSaverDefaults*)ud;

@property BOOL isPreview;
@property AVPlayer *player;
@property ScreenSaverDefaults * ud;
@property NSURL * videoURL;

-(void)didFinishPlaying;

@end

NS_ASSUME_NONNULL_END
