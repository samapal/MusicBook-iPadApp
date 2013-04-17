//
//  ViewController.h
//  assignment1
//
//  Created by Ninglin Li on 4/4/13.
//  Copyright (c) 2013 Ninglin Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *showPage;
@property (weak, nonatomic) IBOutlet UIButton *showInfo;

- (IBAction)showInfoView:(id)sender;

- (IBAction)showPage:(id)sender;
@end
