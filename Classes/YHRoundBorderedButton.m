//
//  YHRoundBorderedButton.m
//  YHRoundBorderedButton
//
//  Created by Yeonghoon Park on 4/10/14.
//  Copyright (c) 2014 yhpark.co. All rights reserved.
//

#import "YHRoundBorderedButton.h"

@interface YHRoundBorderedButton()

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
    
    self.titleLabel.font = [UIFont boldSystemFontOfSize:13];
    
    self.layer.cornerRadius = 3.5;
    self.layer.borderWidth = 1.0;
    
    [self refreshBorderColor];
}

- (void)setPlusIconVisible:(BOOL)plusIconVisible
{
    _plusIconVisible = plusIconVisible;
    
    [self setNeedsDisplay];
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
    self.layer.borderColor = [self isEnabled] ? self.tintColor.CGColor : [UIColor grayColor].CGColor;
}

- (void)setHighlighted:(BOOL)highlighted
{
    // Only change if necessary.
    if ( highlighted == super.highlighted ) {
        return;
    }
    
    [super setHighlighted:highlighted];
    
    [UIView animateWithDuration:0.25f animations:^{
        self.layer.backgroundColor = highlighted ? self.tintColor.CGColor : [UIColor clearColor].CGColor;
    }];
    
    [self setNeedsDisplay];
}

- (CGSize)sizeThatFits:(CGSize)size
{
    CGSize org = [super sizeThatFits:self.bounds.size];
    return CGSizeMake(org.width + 20, org.height - 2);
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    
    // Draw the plus icon.
    if (self.plusIconVisible) {
        // The color to use for the plus icon fill.
        UIColor *color;
        if ([self isHighlighted]) {
            // Set the fill color to white.
            color = [UIColor whiteColor];
        } else if (![self isEnabled]) {
            // Set the fill color to disabled color.
            color = [UIColor grayColor];
        } else {
            // Set the fill color to the tint color.
            color = self.tintColor;
        }
        
        CGContextSetFillColorWithColor(contextRef, color.CGColor);
        
        // Fill the vertical bar with the color.
        CGRect verticalBar = CGRectMake(5, 3, 1, 5);
        CGContextFillRect(contextRef, verticalBar);

        // Fill the horizontal bar with the color.
        CGRect horizontalBar = CGRectMake(3, 5, 5, 1);
        CGContextFillRect(contextRef, horizontalBar);
    }
}

@end
