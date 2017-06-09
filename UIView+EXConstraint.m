//
//  UIView+EXConstraint.m
//  TabarTestDemo
//
//  Created by Yang on 15/12/25.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import "UIView+EXConstraint.h"

@implementation UIView (EXConstraint)

- (NSArray *)addConstraintsWithVisualFormat:(NSString *)format options:(NSLayoutFormatOptions)opts metrics:(NSDictionary *)metrics views:(NSDictionary *)views
{
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:format options:opts metrics:metrics views:views];
    [self addConstraints:constraints];
    return constraints;
}

- (NSLayoutConstraint *)addConstraintWithItem:(id)view1 attribute:(NSLayoutAttribute)attr1 relateBy:(NSLayoutRelation)relate toItem:(id)view2 attribute:(NSLayoutAttribute)attr2 multiplier:(CGFloat)multiplier constant:(CGFloat)c
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:view1 attribute:attr1 relatedBy:relate toItem:view2 attribute:attr2 multiplier:multiplier constant:c];
    [self addConstraint:constraint];
    return constraint;
}

- (NSLayoutConstraint *)addConstraintForSubview:(id)view width:(CGFloat)width
{
    NSLayoutConstraint *constraint = [self addConstraintWithItem:view attribute:NSLayoutAttributeWidth relateBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:width];
    return constraint;
}

- (NSLayoutConstraint *)addConstraintForSubview:(id)view heigth:(CGFloat)heigth
{
    NSLayoutConstraint *constraint = [self addConstraintWithItem:view attribute:NSLayoutAttributeHeight relateBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:heigth];
    return constraint;
}

- (NSArray *)addSquareConstraintsForSubView:(id)subview width:(CGFloat)width
{
    NSLayoutConstraint *widthConstraint = [self addConstraintWithItem:subview attribute:NSLayoutAttributeWidth relateBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:width];
    NSLayoutConstraint *heightConstraint = [self addConstraintWithItem:subview attribute:NSLayoutAttributeHeight relateBy:NSLayoutRelationEqual toItem:subview attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0];
    
    return @[widthConstraint, heightConstraint];
}

- (NSArray *)addConstraintsForSubview:(id)view left:(CGFloat)left right:(CGFloat)rigth
{
    NSString *format;
    
    if (left != NOTNEED && rigth != NOTNEED)
    {
        format = @"H:|-L-[view]-R-|";
    } else if (left != NOTNEED && rigth == NOTNEED)
    {
        format = @"H:|-L-[view]";
    } else if (left == NOTNEED && rigth != NOTNEED)
    {
        format = @"H:[view]-R-|";
    } else
    {
        return nil;
    }
    
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:format options:0 metrics:@{@"L":@(left), @"R":@(rigth)} views:NSDictionaryOfVariableBindings(view)];
    [self addConstraints:constraints];
    return constraints;
}

- (NSArray *)addConstraintsForSubview:(id)view top:(CGFloat)top bottom:(CGFloat)bottom
{
    NSString *format;
    
    if (top != NOTNEED && bottom != NOTNEED)
    {
        format = @"V:|-T-[view]-B-|";
    } else if (top != NOTNEED && bottom == NOTNEED)
    {
        format = @"V:|-T-[view]";
    } else if (top == NOTNEED && bottom != NOTNEED)
    {
        format = @"V:[view]-B-|";
    } else
    {
        return nil;
    }
    
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:format options:0 metrics:@{@"T":@(top), @"B":@(bottom)} views:NSDictionaryOfVariableBindings(view)];
    [self addConstraints:constraints];
    return constraints;
}

- (NSArray *)addConstraintsForSubview:(id)view left:(CGFloat)left right:(CGFloat)rigth top:(CGFloat)top bottom:(CGFloat)bottom
{
    NSArray *h = [self addConstraintsForSubview:view left:left right:rigth];
    NSArray *v = [self addConstraintsForSubview:view top:top bottom:bottom];
    
    NSMutableArray *constraints = [[NSMutableArray alloc] initWithArray:h];
    [constraints addObjectsFromArray:v];
    
    return constraints;
}

- (NSLayoutConstraint *)addCenterYConstraintForSubview:(id)view
{
    NSLayoutConstraint *constraint = [self addConstraintWithItem:view attribute:NSLayoutAttributeCenterY relateBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    return constraint;
}

- (NSLayoutConstraint *)addCenterXConstraintForSubview:(id)view
{
    NSLayoutConstraint *constraint = [self addConstraintWithItem:view attribute:NSLayoutAttributeCenterX relateBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    return constraint;
}

@end
