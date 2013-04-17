//
//  RootViewController.h
//  assignment1
//
//  Created by Ninglin Li on 4/3/13.
//  Copyright (c) 2013 Ninglin Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController <UIPageViewControllerDelegate>

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSMutableArray *models;
@end
