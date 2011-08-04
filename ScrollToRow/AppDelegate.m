#import "AppDelegate.h"
#import "ScrollToRowViewController.h"

@implementation AppDelegate

- (BOOL) application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	UIViewController *viewController = [[ScrollToRowViewController alloc] initWithNibName:@"ScrollToRowViewController" bundle:nil]; 
	window.rootViewController = viewController;
	[window makeKeyAndVisible];
	return YES;
}

@end
