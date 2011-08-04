#import "ScrollToRowViewController.h"

@implementation ScrollToRowViewController

@synthesize tableView;
@synthesize stopAnimationsSwitch;
@synthesize animateSecondScroll;

- (void) stopAnimations
{
	SEL _stopScrollingAndZoomingAnimations = @selector(_stopScrollingAndZoomingAnimations);
	SEL _cancelPendingAnimations = @selector(_cancelPendingAnimations);
	if ([self.tableView respondsToSelector:_stopScrollingAndZoomingAnimations])
	{
		// iOS 5.x
		[self.tableView performSelector:_stopScrollingAndZoomingAnimations];
	}
	else if ([self.tableView respondsToSelector:_cancelPendingAnimations])
	{
		// iOS 4.x
		[self.tableView performSelector:_cancelPendingAnimations];
	}
	else
	{
		// iOS 3.x
		NSLog(@"Could not stop animations");
	}
}

- (IBAction) scrollTwiceToRow:(id)sender
{
	[self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:32 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
	if (self.stopAnimationsSwitch.on)
		[self stopAnimations];
	[self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:64 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:self.animateSecondScroll.on];
}

- (NSInteger) tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section
{	
	return 128;
}

- (UITableViewCell *) tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier:@"SimpleCell"];
	if (!cell)
	{
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SimpleCell"] autorelease];
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
	}
	
	cell.textLabel.text = [NSString stringWithFormat:@"Row #%u", indexPath.row];
	
	return cell;
}

@end
