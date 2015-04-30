//
//  Created by Cédric Luthi on 29.04.15.
//  Copyright (c) 2015 Cédric Luthi. All rights reserved.
//

#import "ViewController.h"

#import <MediaPlayer/MediaPlayer.h>

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIView *videoView;

@property (nonatomic) MPMoviePlayerController *moviePlayerController;

@end

@implementation ViewController

- (IBAction) playBasicStream:(id)sender
{
	NSURL *streamURL = [NSURL URLWithString:@"https://devimages.apple.com.edgekey.net/streaming/examples/bipbop_4x3/bipbop_4x3_variant.m3u8"];
	[self playStreamURL:streamURL];
}

- (IBAction) playAdvancedStream:(id)sender
{
	NSURL *streamURL = [NSURL URLWithString:@"https://devimages.apple.com.edgekey.net/streaming/examples/bipbop_16x9/bipbop_16x9_variant.m3u8"];
	[self playStreamURL:streamURL];
}

- (IBAction) stop:(id)sender
{
	[self.moviePlayerController stop];
}

- (void) playStreamURL:(NSURL *)streamURL
{
	[self.moviePlayerController stop];
	self.moviePlayerController.contentURL = streamURL;
	[self.moviePlayerController play];
}

- (MPMoviePlayerController *) moviePlayerController
{
	if (!_moviePlayerController)
	{
		_moviePlayerController = [MPMoviePlayerController new];
		_moviePlayerController.view.frame = CGRectMake(0.f, 0.f, self.videoView.bounds.size.width, self.videoView.bounds.size.height);
		_moviePlayerController.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
		[self.videoView addSubview:_moviePlayerController.view];
	}
	return _moviePlayerController;
}

@end
