@interface ScrollToRowViewController : UIViewController

@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) IBOutlet UISwitch *stopAnimationsSwitch;
@property (nonatomic, retain) IBOutlet UISwitch *animateSecondScroll;

- (IBAction) scrollTwiceToRow:(id)sender;

@end
