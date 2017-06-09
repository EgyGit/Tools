//
//  UIView+EXConstraint.h
//  TabarTestDemo
//
//  Created by Yang on 15/12/25.
//  Copyright © 2015年 Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define NOTNEED -10000

@interface UIView (EXConstraint)

- (NSArray *)addConstraintsWithVisualFormat:(NSString *)format options:(NSLayoutFormatOptions)opts metrics:(NSDictionary *)metrics views:(NSDictionary *)views;

- (NSLayoutConstraint *)addConstraintWithItem:(id)view1 attribute:(NSLayoutAttribute)attr1 relateBy:(NSLayoutRelation)relate toItem:(id)view2 attribute:(NSLayoutAttribute)attr2 multiplier:(CGFloat)multiplier constant:(CGFloat)c;

/**
 * 添加width约束
 */
- (NSLayoutConstraint *)addConstraintForSubview:(id)view width:(CGFloat)width;

/**
 * 添加height约束
 */
- (NSLayoutConstraint *)addConstraintForSubview:(id)view heigth:(CGFloat)heigth;

/**
 * 为水平方向添加约束（负值将不添加）
 */
- (NSArray *)addConstraintsForSubview:(id)view left:(CGFloat)left right:(CGFloat)rigth;

/**
 * 为竖直方向添加约束（负值将不添加）
 */
- (NSArray *)addConstraintsForSubview:(id)view top:(CGFloat)top bottom:(CGFloat)bottom;

/**
 * 四周约束（负值将不添加）
 */
- (NSArray *)addConstraintsForSubview:(id)view left:(CGFloat)left right:(CGFloat)rigth top:(CGFloat)top bottom:(CGFloat)bottom;

/**
 * 竖直方向中心对齐
 */
- (NSLayoutConstraint *)addCenterYConstraintForSubview:(id)view;

/**
 * 水平方向中心对齐
 */
- (NSLayoutConstraint *)addCenterXConstraintForSubview:(id)view;

@end
