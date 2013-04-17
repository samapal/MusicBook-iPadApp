//
//  DataViewController.h
//  assignment1
//
//  Created by Ninglin Li on 4/3/13.
//  Copyright (c) 2013 Ninglin Li. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface DataViewController : UIViewController

@property (strong, nonatomic) AVAudioPlayer *backgroundMusic;
@property (strong, nonatomic) IBOutlet UILabel *dataLabel;
@property (strong, nonatomic) id dataObject;
@property (weak, nonatomic) IBOutlet UILabel *lyrics;
@property (weak, nonatomic) IBOutlet UIButton *homeButton;
@property (weak, nonatomic) IBOutlet UIImageView *imageup;
@property (weak, nonatomic) IBOutlet UIImageView *imagedown;

- (IBAction)backHome:(id)sender;

@end
