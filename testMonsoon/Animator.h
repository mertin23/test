//
//  Animator.h
//  testMonsoon
//
//  Created by Mertin on 07/06/15.
//  Copyright (c) 2015 Mertin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

@interface Animator : NSObject <UIViewControllerAnimatedTransitioning>
@property (weak) id<UIViewControllerContextTransitioning> transitionContext;

@end
