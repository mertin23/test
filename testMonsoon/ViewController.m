//
//  ViewController.m
//  testMonsoon
//
//  Created by Mertin on 05/06/15.
//  Copyright (c) 2015 Mertin. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "CustomControl.h"
#import "DetailsController.h"
#import "NavigationControllerDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    int widthAvailable=[[UIScreen mainScreen] bounds].size.width;
    int spaceV=10;
    int spaceH=20;
    int size=(widthAvailable-3*spaceH)/2; // size of custom controls
    
   
    if([[UIScreen mainScreen] bounds].size.height<568) //dimensions for iphone 4s
    {
        size=112;
        spaceV=5;
    }
   
    self.bubbles=[[NSMutableArray alloc] init];
    
    CustomControl *cc=[[CustomControl alloc]  initWithArray:CGRectMake(widthAvailable/4-size/2+5, 60, size, size)  andWithArray:@[@"ONE OF A KIND",@"MASS MARKET",@"SMALL BATCH", @"LARGE BATCH"]];
    [self.bubbles addObject:cc];
   
    [self.view addSubview:cc];
    CustomControl *cc1=[[CustomControl alloc] initWithArray:CGRectMake(widthAvailable*3/4-size/2-5, 60, size, size)  andWithArray:@[@"SAVORY", @"SWEET", @"UMAMI"]];
    [self.bubbles addObject:cc1];
    [self.view addSubview:cc1];
    
    CustomControl *cc2=[[CustomControl alloc] initWithArray:CGRectMake(widthAvailable/4-size/2+5, 60+spaceV+size, size, size)  andWithArray:@[@"CRUNCHY", @"MUSHY", @"SMOOTH"]];
    [self.bubbles addObject:cc2];
    [self.view addSubview:cc2];
    
    CustomControl *cc3=[[CustomControl alloc] initWithArray:CGRectMake(widthAvailable*3/4-size/2-5, 60+spaceV+size, size, size)  andWithArray:@[@"SPICY",@"MILD"]];
    [self.bubbles addObject:cc3];
    [self.view addSubview:cc3];
    
    CustomControl *cc4=[[CustomControl alloc] initWithArray:CGRectMake(widthAvailable/4-size/2+5, 60+2*spaceV+2*size, size, size)  andWithArray:@[@"A LITTLE" ,@"A LOT"]];
    [self.bubbles addObject:cc4];
    [self.view addSubview:cc4];
    
    CustomControl *cc5=[[CustomControl alloc] initWithArray:CGRectMake(widthAvailable*3/4-size/2-5, 60+2*spaceV+2*size, size, size)  andWithArray:@[@"BREAKFAST", @"BRUNCH" , @"LUNCH", @"SNACK", @"DINNER"]];
    [self.bubbles addObject:cc5];
    [self.view addSubview:cc5];


    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)goTap:(id)sender { //go to the next view with the selected options
    DetailsController *details=[self.storyboard instantiateViewControllerWithIdentifier:@"details"];
    NSMutableArray *selectedOptions=[[NSMutableArray alloc]init];//list of selected options
    for(CustomControl *cc in self.bubbles)
    {
        [selectedOptions addObject:cc.label.text];
    }
    details.listOfChoices=selectedOptions;
    [self.navigationController pushViewController:details animated:YES];
    
}
-(void) viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden=YES;
}

- (IBAction)randomTap:(id)sender {
    
    for(CustomControl *cc in self.bubbles)
    {
        [cc setRandom:arc4random_uniform(cc.max+1)];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
