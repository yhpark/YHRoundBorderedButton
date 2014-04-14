//
//  YHRoundBorderedButton.m
//  YHRoundBorderedButton
//
//  Created by Yeonghoon Park on 4/10/14.
//  Copyright (c) 2014 yhpark.co. All rights reserved.
//

#import "YHRoundBorderedButton.h"

@interface YHRoundBorderedButton()

@property(nonatomic, assign) BOOL plusIconVisible;

@end

@implementation YHRoundBorderedButton

- (id)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    [self setTitleColor:[self tintColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [self setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    [self.titleLabel setFont:[UIFont boldSystemFontOfSize:13]];
    self.layer.cornerRadius = 3.5;
    self.layer.borderWidth = 1.0;
    [self refreshBorderColor];
}

- (void)setPlusIconVisibility:(BOOL)show
{
    self.plusIconVisible = show;
    
    // TODO
}

- (void)setTintColor:(UIColor *)tintColor
{
    [super setTintColor:tintColor];
    [self setTitleColor:tintColor forState:UIControlStateNormal];
    [self refreshBorderColor];
}

- (void)setEnabled:(BOOL)enabled
{
    [super setEnabled:enabled];
    
    [self refreshBorderColor];
}

- (void)refreshBorderColor
{
    self.layer.borderColor = [self isEnabled] ? [[self tintColor] CGColor] : [[UIColor grayColor] CGColor];
}

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    
    [UIView animateWithDuration:0.25f animations:^{
        self.layer.backgroundColor = highlighted ? [[self tintColor] CGColor] : [[UIColor clearColor] CGColor];
    }];
}

- (CGSize)sizeThatFits:(CGSize)size
{
    CGSize org = [super sizeThatFits:self.bounds.size];
    return CGSizeMake(org.width + 20, org.height - 2);
}

@end
