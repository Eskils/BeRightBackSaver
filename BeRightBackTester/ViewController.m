//
//  ViewController.m
//  BeRightBackTester
//
//  Created by Eskil Sviggum on 27/11/2021.
//

#import "ViewController.h"

@implementation ViewController

- (void)loadView {
    CGRect frame = CGRectMake(0, 0, 800, 800);
    BeRightBackView *view = [[BeRightBackView alloc] initWithFrame:frame isPreview:NO];
    
    view.wantsLayer = YES;
    view.layer.backgroundColor = NSColor.blackColor.CGColor;
    
    self.view = view;
}

@end
