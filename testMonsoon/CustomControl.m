//
//  CustomControl.m
//  testMonsoon
//
//  Created by Mertin on 05/06/15.
//  Copyright (c) 2015 Mertin. All rights reserved.
//

#import "CustomControl.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>



@implementation CustomControl

-(id) initWithArray:(CGRect) frame andWithArray:(NSArray*)array
{
    self.labels=[NSMutableArray arrayWithArray:array];
    self.max=(int)self.labels.count-1;
    self.current=0;
    return  [self initWithFrame:frame];
   
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor=[UIColor clearColor];
     /*   CAShapeLayer *circle=[CAShapeLayer layer]; *alternative way to draw circles
        circle.path=[UIBezierPath bezierPathWithRoundedRect:CGRectMake(2, 2, frame.size.height-4, frame.size.width-4) cornerRadius:frame.size.width/2-5].CGPath;
        circle.position=CGPointMake(0,0);
        circle.fillColor=[UIColor colorWithWhite:0.0 alpha:0.2].CGColor;
        circle.lineWidth=0;*/
        _arcs=[[NSMutableArray alloc] init];
        
        //add arcs around circle
        for(int i=0;i<=self.max;i++)
        {
            CAShapeLayer *arc=[CAShapeLayer layer];
            
            arc.path=[UIBezierPath bezierPathWithArcCenter:CGPointMake(frame.size.width/2,frame.size.width/2) radius:frame.size.width/2 startAngle:M_PI/2+0.1+2*M_PI*i/(self.max+1) endAngle:M_PI/2+2*M_PI*(i+1)/(self.max+1)-0.1 clockwise:YES].CGPath;
            
            //the option that was selected should have a different color
            if(i!=0)
                arc.strokeColor=[[UIColor alloc] initWithRed:118.0f/255.0f green:24.0f/255.0f blue:58.0f/255.0f alpha:1 ].CGColor;
            else
                arc.strokeColor=[[UIColor alloc] initWithRed:1 green:110.0f/255.0f blue:110.0f/255.0f alpha:1 ].CGColor;
            
            arc.lineWidth=1;
            arc.fillColor=[UIColor clearColor].CGColor;
            [self.layer addSublayer:arc];
            [_arcs addObject:arc];
        }
        
        UITapGestureRecognizer *singleTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapped:)];
        [self addGestureRecognizer:singleTap];
        
        //add label with the current option
        _label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.width)];
        _label.text=[self.labels objectAtIndex:self.current];
        _label.adjustsFontSizeToFitWidth=YES;
        _label.textAlignment=NSTextAlignmentCenter;
        _label.textColor=[UIColor whiteColor];
        [self addSubview:_label];

    }
    
    return self;
}

-(void) setRandom:(int) selectedIndex
{
    //randomly selected option
    [self setSelection:selectedIndex];
    
    CAKeyframeAnimation *anim =[CAKeyframeAnimation animationWithKeyPath:@"transform"];
    anim.values=@[[NSValue valueWithCATransform3D:CATransform3DMakeTranslation(-5.0f, 0.0f, 0.0f)],[NSValue valueWithCATransform3D:CATransform3DMakeTranslation(5.0f, 0.0f, 0.0f)]];
    anim.autoreverses=YES;
    anim.repeatCount=2.0f;
    anim.duration=0.0f;
    [self.layer addAnimation:anim forKey:nil];
    
    AudioServicesPlaySystemSound(1004);
}

-(void) tapped:(UITapGestureRecognizer*)recognizer
{
    [self setSelection:self.current];
}
-(void) setSelection:(int) selectedIndex
{
    CAShapeLayer *arctmp= [_arcs objectAtIndex:selectedIndex];
    arctmp.strokeColor=[[UIColor alloc] initWithRed:118.0f/255.0f green:24.0f/255.0f blue:58.0f/255.0f alpha:1 ].CGColor;
    if(self.max==selectedIndex)
       selectedIndex=0;
    else
        selectedIndex++;
    arctmp=[_arcs objectAtIndex:selectedIndex];
    arctmp.strokeColor=[[UIColor alloc] initWithRed:1 green:110.0f/255.0f blue:110.0f/255.0f alpha:1 ].CGColor;
    _label.text=[self.labels objectAtIndex:selectedIndex];
    self.current=selectedIndex;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 0.0);
  
    CGContextSetFillColorWithColor(context, [UIColor colorWithWhite:0.0 alpha:0.2].CGColor);
    CGContextBeginPath(context);
    
    //circles should be smaller than the custom control
    CGRect rect2=rect;
    rect2.size.width-=6;
    rect2.size.height-=6;
    rect2.origin.x+=3;
    rect2.origin.y+=3;
  
    CGContextAddEllipseInRect(context, rect2);
    CGContextDrawPath(context, kCGPathFillStroke);
 
  }


@end
