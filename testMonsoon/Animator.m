//
//  Animator.m
//  testMonsoon
//
//  Created by Mertin on 07/06/15.
//  Copyright (c) 2015 Mertin. All rights reserved.
//

#import "Animator.h"

@implementation Animator
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 1;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    self.transitionContext=transitionContext;
    UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    [[transitionContext containerView] addSubview:toViewController.view];
    toViewController.view.alpha = 0;
    
    UIBezierPath *path=[UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 100)];
   
    CGPoint point=CGPointMake(toViewController.view.bounds.size.height, toViewController.view.bounds.size.height);
    float radius=sqrt(point.x*point.x+point.y+point.y);
    UIBezierPath *circlePathFinal=[UIBezierPath bezierPathWithOvalInRect:CGRectInset(CGRectMake(0, 0, 100, 100), -radius, -radius)];
    CAShapeLayer *shape=[[CAShapeLayer alloc]init];
    shape.path=circlePathFinal.CGPath;
    toViewController.view.layer.mask=shape;
    
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"path"];
    animation.fromValue=(__bridge id)(path.CGPath);
    animation.toValue=(__bridge id)(circlePathFinal.CGPath);
    animation.duration=1.0f;
    animation.delegate=self;
    [shape addAnimation:animation forKey:@"path"];
    
   [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromViewController.view.transform = CGAffineTransformMakeScale(0.1, 0.1);
        toViewController.view.alpha = 1;
    } completion:^(BOOL finished) {
        fromViewController.view.transform = CGAffineTransformIdentity;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        
    }];
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    [self.transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey ].view.layer.mask=nil;
}

@end
