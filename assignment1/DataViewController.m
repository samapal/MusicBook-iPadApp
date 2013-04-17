//
//  DataViewController.m
//  assignment1
//
//  Created by Ninglin Li on 4/3/13.
//  Copyright (c) 2013 Ninglin Li. All rights reserved.
//

#import "DataViewController.h"
#import "ViewController.h"
#import "ModelController.h"
#import <AVFoundation/AVFoundation.h>

@interface DataViewController ()

@end

@implementation DataViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.homeButton setBackgroundColor:[UIColor clearColor]];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *imageUpName = [[self.dataObject objectForKey:@"images"] objectAtIndex:0];
    NSString *imageDownName = [[self.dataObject objectForKey:@"images"] objectAtIndex:1];
    self.imageup.image = [UIImage imageNamed:imageUpName];
    self.imagedown.image = [UIImage imageNamed:imageDownName];
    
    //rotate imageup
    NSTimeInterval duration = 10.0f;
    CGFloat angle = M_PI / 4.0f;
    CGAffineTransform rotateTransform = CGAffineTransformRotate(self.imageup.transform, angle);
    
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionRepeat| UIViewAnimationOptionCurveLinear animations:^{
        self.imageup.transform = rotateTransform;
    } completion:nil];
    
    
//    NSTimeInterval durationUp = 1.0;
    
    [UIView animateWithDuration:3.0 delay:1.0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         CGRect f = self.imagedown.frame;
                         f.origin.y -= 15;
                         self.imagedown.frame = f;
                     }
                     completion:nil];
    
 }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    NSLog(@"%@", self.dataObject);

    self.dataLabel.text = [self.dataObject objectForKey:@"title"];
    
    NSString *lyricsfromplist = [self.dataObject objectForKey:@"lyrics"];
    NSString *myNewLineStr = @"\n";
    NSString *lyricsInLine = [lyricsfromplist stringByReplacingOccurrencesOfString:@"\\n" withString:myNewLineStr];

    self.lyrics.text = lyricsInLine;
    //seperate lyrics t to multiple lines
    self.lyrics.lineBreakMode = NSLineBreakByWordWrapping;
    self.lyrics.numberOfLines = 0;
    [self playBackgroundMusic];
    [self displayLyrics];
    
}


-(void)displayLyrics{

    NSInteger wordcount = [[[self.dataObject objectForKey:@"music"] objectForKey:@"time"] count];
    NSLog(@"word count is %d", wordcount);
    for (int i = 0; i < wordcount; i++) {
        NSNumber *starttime = [[[[self.dataObject objectForKey:@"music"] objectForKey:@"time"] objectAtIndex:i] objectForKey:@"start"];
        double startAt = [starttime doubleValue];
        NSDictionary *wordSection = [[[self.dataObject objectForKey:@"music"] objectForKey:@"sections"] objectAtIndex:i];
        [self performSelector:@selector(highlightWord:) withObject:wordSection afterDelay:startAt];
    }
}

-(void)highlightWord:(id)section{
    NSString *myNewLineStr = @"\n";
    NSString *lyricsfromplist = [self.lyrics.text stringByReplacingOccurrencesOfString:@"\\n" withString:myNewLineStr];
//    NSLog(@"%@", lyricsfromplist);
    UIColor *_blue=[UIColor darkGrayColor];
    UIColor *_blueL=[UIColor orangeColor];
    UIFont *font=[UIFont fontWithName:@"MarkerFelt-Wide" size:25.0f];
    
    NSMutableAttributedString *lyricscontent=[[NSMutableAttributedString alloc] initWithString:lyricsfromplist];
    NSInteger _stringLength=[lyricscontent length];
    [lyricscontent addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, _stringLength)];
    [lyricscontent addAttribute:NSForegroundColorAttributeName value:_blue range:NSMakeRange(0, _stringLength)];
    
    NSNumber *startpoint = [section objectForKey:@"start"];   
    NSNumber *endpoint = [section objectForKey:@"end"];
    int startAt = [startpoint integerValue];
    int endAt = [endpoint integerValue];
//    NSLog(@"start at %d, end at %d", startAt, endAt);
    
    [lyricscontent addAttribute:NSBackgroundColorAttributeName value:_blueL range:NSMakeRange(startAt, endAt)];
    self.lyrics.attributedText = lyricscontent;
}

-(void)viewWillDisappear:(BOOL)animated{
    [self.backgroundMusic stop];
}

- (IBAction)backHome:(id)sender {
    ViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
    [self.navigationController pushViewController:vc animated:YES];
    [self.backgroundMusic stop];
}

-(void)playBackgroundMusic{
    NSError *error;
    NSString *pathname = [[self.dataObject objectForKey:@"music"] objectForKey:@"name"];
    NSLog(@"%@", pathname);
    NSString *backgroundMusicPath = [[NSBundle mainBundle] pathForResource:pathname ofType:@"mp3"];
    NSLog(@"%@",backgroundMusicPath);
    NSURL *backgroundMusicURL = [NSURL fileURLWithPath:backgroundMusicPath];
    NSLog(@"%@", backgroundMusicURL);
    _backgroundMusic = [[AVAudioPlayer alloc] initWithContentsOfURL:backgroundMusicURL error:&error];
    [self.backgroundMusic prepareToPlay];    
    [self.backgroundMusic play];
}


@end
