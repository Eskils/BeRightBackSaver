//
//  BeRightBackView.m
//  BeRightBack
//
//  Created by Eskil Sviggum on 26/11/2021.
//

#import "BeRightBackView.h"

@interface BeRightBackView ()

@property (weak) IBOutlet NSWindow *settings;
@property (weak) IBOutlet NSButton *okButton;
@property (weak) IBOutlet NSButton *cancelButton;
@property (weak) IBOutlet NSTextField *subtextInput;

@end

@implementation BeRightBackView

BOOL isInPreview;

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        isInPreview = isPreview;
        self.bundle = [NSBundle bundleForClass: [self class]];
        self.ud = [ScreenSaverDefaults defaultsForModuleWithName: @"BeRightBack"];
        
        [self.ud registerDefaults:@{
            @"SUBTEXT": @"Check back soon."
        }];
    }
    return self;
}

- (void)startAnimation
{
    [super startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

#pragma mark - Setup View
- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
    
    NSURL *videoURL = [Screensaver videoUrlFromBundle:self.bundle];
    VideoView *videoView = [[VideoView alloc] initWithVideoURL: videoURL andDefaults:self.ud];
    videoView.isPreview = isInPreview;
    [NSNotificationCenter.defaultCenter addObserver:videoView selector:@selector(didFinishPlaying) name: AVPlayerItemDidPlayToEndTimeNotification object:NULL];
    [self addSubview:videoView];
    
    videoView.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints: @[
        [videoView.centerXAnchor constraintEqualToAnchor: self.centerXAnchor],
        [videoView.centerYAnchor constraintEqualToAnchor: self.centerYAnchor],
    ]];
}

- (void)animateOneFrame
{
    return;
}

- (BOOL)hasConfigureSheet
{
    return YES;
}

#pragma mark - Settings

- (NSWindow*)configureSheet
{
    if (!self.settings) {
       [[NSBundle bundleForClass:self.class] loadNibNamed:@"Settings" owner:self topLevelObjects:nil];
     }
     return self.settings;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.okButton becomeFirstResponder];
    
    NSString * subtext = [self.ud stringForKey:@"SUBTEXT"];
    if (subtext == NULL) { subtext = @""; }
    [self.subtextInput setStringValue:subtext];
    
    [self.okButton setTarget: self];
    [self.cancelButton setTarget: self];
    
    [self.cancelButton setAction:@selector(cancel)];
    [self.okButton setAction:@selector(ok)];
}


-(void)cancel {
    [self close];
}

-(void)ok {
    [self save];
    [self close];
}

-(void)close {
    [[NSApplication sharedApplication] endSheet: self.settings];
}

-(void)save {
    NSString * subtext = self.subtextInput.stringValue;
    [self.ud setValue: subtext forKey: @"SUBTEXT"];
    [self.ud synchronize];
}

@end
