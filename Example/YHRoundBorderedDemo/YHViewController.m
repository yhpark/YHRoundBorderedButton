//
//  YHViewController.m
//  YHRoundBorderedDemo
//
//  Created by Yeonghoon Park on 4/10/14.
//  Copyright (c) 2014 yhpark.co. All rights reserved.
//

#import "YHViewController.h"

#import "YHRoundBorderedButton.h"

@interface YHViewController ()

@property (strong, nonatomic) UIImageView *openImage;
@property (strong, nonatomic) YHRoundBorderedButton *openButton;
@property (strong, nonatomic) YHRoundBorderedButton *greenButton;

@property (strong, nonatomic) YHRoundBorderedButton *updateButton;
@property (strong, nonatomic) YHRoundBorderedButton *usd199Button;
@property (strong, nonatomic) YHRoundBorderedButton *disabledButton;

@property (assign, nonatomic) NSInteger posY;

@end

@implementation YHViewController

- (void)loadView
{
    [super loadView];
    
    self.openImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"open"]];
    [self.openImage sizeToFit];
    [self.view addSubview:self.openImage];
    
    self.openButton = [[YHRoundBorderedButton alloc] init];
    [self.openButton setTitle:@"OPEN" forState:UIControlStateNormal];
    [self.openButton sizeToFit];
    [self.view addSubview:self.openButton];
    
    self.greenButton = [[YHRoundBorderedButton alloc] init];
    [self.greenButton setTitle:@"OPEN" forState:UIControlStateNormal];
    [self.greenButton sizeToFit];
    [self.greenButton setTintColor:[UIColor colorWithRed:0.30 green:0.85 blue:0.39 alpha:1.00]];
    [self.view addSubview:self.greenButton];
    
    self.updateButton = [[YHRoundBorderedButton alloc] init];
    [self.updateButton setTitle:@"UPDATE" forState:UIControlStateNormal];
    [self.updateButton sizeToFit];
    [self.view addSubview:self.updateButton];
    
    self.usd199Button = [[YHRoundBorderedButton alloc] init];
    [self.usd199Button setTitle:@"$1.99" forState:UIControlStateNormal];
    [self.usd199Button sizeToFit];
    self.usd199Button.plusIconVisible = YES;
    [self.view addSubview:self.usd199Button];
    
    self.disabledButton = [[YHRoundBorderedButton alloc] init];
    [self.disabledButton setTitle:@"DISABLED" forState:UIControlStateNormal];
    [self.disabledButton sizeToFit];
    self.disabledButton.enabled = NO;
    [self.view addSubview:self.disabledButton];
}

- (void)viewWillLayoutSubviews
{
    self.greenButton.center = [self nextPosition];
    self.openButton.center = [self nextPosition];
    self.openImage.center = CGPointMake(self.openButton.center.x, self.openButton.center.y - 30);
    self.updateButton.center = [self nextPosition];
    self.usd199Button.center = [self nextPosition];
    self.disabledButton.center = [self nextPosition];
    
    [UIView animateWithDuration:2 animations:^{
        self.openImage.center = self.openButton.center;
    }];
}

- (CGPoint)nextPosition
{
    if ( !self.posY ) {
        self.posY = 50;
    }
    
    self.posY += 80;
    
    return CGPointMake(self.view.center.x, self.posY);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

@end
