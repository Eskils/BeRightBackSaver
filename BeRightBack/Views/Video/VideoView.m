//
//  VideoView.m
//  BeRightBack
//
//  Created by Eskil Sviggum on 26/11/2021.
//

#import "VideoView.h"

@implementation VideoView

#pragma mark - INIT
-(instancetype)initWithVideoURL:(NSURL*)videoURL andDefaults:(ScreenSaverDefaults*)ud {
    self = [super initWithFrame: CGRectZero];
    if (self) {
        self.isPreview = NO;
        self.videoURL = videoURL;
        self.ud = ud;
    }
    
    return self;
}

- (void)viewDidMoveToSuperview {
    [super viewDidMoveToSuperview];
    
    #pragma mark - Player Setup
    AVPlayerView *playerView = [[AVPlayerView alloc] init];
    self.player = [AVPlayer playerWithURL: self.videoURL];
    
    playerView.player = self.player;
    playerView.showsTimecodes = NO;
    playerView.showsFrameSteppingButtons = NO;
    playerView.showsSharingServiceButton = NO;
    playerView.showsFullScreenToggleButton = NO;
    playerView.updatesNowPlayingInfoCenter = NO;
    playerView.allowsPictureInPicturePlayback = NO;
    playerView.controlsStyle = AVPlayerViewControlsStyleNone;
    [self addSubview: playerView];
    [self.player play];
    
    #pragma mark - BRB Label Setup
    NSTextField * BRBLabel = [NSTextField labelWithString: [Screensaver tagline]];
    [BRBLabel setFont: [Screensaver taglineFont]];
    [BRBLabel setTextColor: [Screensaver textColor]];
    [self addSubview: BRBLabel];
    
    #pragma mark - Sub Label Setup
    NSTextField * subLabel = [NSTextField labelWithString: [Screensaver subtextFromUD:self.ud]];
    subLabel.maximumNumberOfLines = 0;
    subLabel.alignment = NSTextAlignmentCenter;
    [subLabel setFont: [Screensaver subtextFont]];
    [subLabel setTextColor: [Screensaver textColor]];
    [self addSubview: subLabel];
    
    #pragma mark - Constraints
    playerView.translatesAutoresizingMaskIntoConstraints = NO;
    BRBLabel.translatesAutoresizingMaskIntoConstraints = NO;
    subLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    CGFloat width = 2*520;
    CGFloat height = 632/2;
    CGFloat BRBLabelPadddingTop = 55;
    CGFloat subLabelPadddingTop = 19;
    
    if (self.isPreview) {
        width /= 4; height /= 4;
        [BRBLabel setFont: [BRBLabel.font fontWithSize: 64 / 3]];
        [subLabel setFont: [subLabel.font fontWithSize: 18 / 2]];
        BRBLabelPadddingTop = 14;
        subLabelPadddingTop = 2;
    }
    
    [NSLayoutConstraint activateConstraints: @[
        //PlayerView
        [playerView.topAnchor constraintEqualToAnchor: self.topAnchor],
        [playerView.centerXAnchor constraintEqualToAnchor: BRBLabel.centerXAnchor],
        [playerView.widthAnchor constraintEqualToConstant: width],
        [playerView.heightAnchor constraintEqualToConstant: height],
        //BRBLabel
        [BRBLabel.topAnchor constraintEqualToAnchor: playerView.bottomAnchor constant: BRBLabelPadddingTop],
        [BRBLabel.leadingAnchor constraintEqualToAnchor: self.leadingAnchor],
        [BRBLabel.trailingAnchor constraintEqualToAnchor: self.trailingAnchor],
        //SubLabel
        [subLabel.topAnchor constraintEqualToAnchor: BRBLabel.bottomAnchor constant: subLabelPadddingTop],
        [subLabel.leadingAnchor constraintEqualToAnchor: BRBLabel.leadingAnchor],
        [subLabel.trailingAnchor constraintEqualToAnchor: BRBLabel.trailingAnchor],
        [subLabel.bottomAnchor constraintEqualToAnchor: self.bottomAnchor],
    ]];
}

-(void)didFinishPlaying {
    [self.player seekToTime: kCMTimeZero];
    [self.player play];
}

@end
