//
//  CustomControl.h
//  testMonsoon
//
//  Created by Mertin on 05/06/15.
//  Copyright (c) 2015 Mertin. All rights reserved.
//

#import <UIKit/UIKit.h>
IB_DESIGNABLE
@interface CustomControl : UIView
-(id)initWithArray:(CGRect) frame andWithArray:(NSArray*)array;
-(void)setSelection:(int)nr;
-(void)setRandom:(int)nr;
@property(strong,atomic) UILabel *label;
@property(strong,atomic) NSMutableArray *arcs;
@property(strong,atomic) NSMutableArray *labels;
@property(assign) int max;
@property(assign) int current;


@end
