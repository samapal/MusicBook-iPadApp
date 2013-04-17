//
//  ViewController.m
//  assignment1
//
//  Created by Ninglin Li on 4/4/13.
//  Copyright (c) 2013 Ninglin Li. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"
#import "RootViewController.h"
#import "DataViewController.h"
#import "ModelController.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.showInfo setBackgroundColor:[UIColor clearColor]];
    [self.showPage setBackgroundColor:[UIColor clearColor]];
    
    // check if pageNumber store in NSUserDefault
    NSLog(@"in view controller, viewdidload");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showInfoView:(id)sender {
    TableViewController *tvc = [[TableViewController alloc] initWithNibName:@"table" bundle:[NSBundle mainBundle]];
 //   TableViewController *tvc =[[self storyboard] instantiateViewControllerWithIdentifier:@"TableViewController"];
    [self.navigationController pushViewController:tvc animated:YES];
}

- (IBAction)showPage:(id)sender {
    RootViewController *rvc = [[self storyboard] instantiateViewControllerWithIdentifier:@"RootViewController"];
    [self.navigationController pushViewController:rvc animated:YES];
}
@end
