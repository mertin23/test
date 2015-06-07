//
//  DetailsController.m
//  testMonsoon
//
//  Created by Mertin on 06/06/15.
//  Copyright (c) 2015 Mertin. All rights reserved.
//

#import "DetailsController.h"

@interface DetailsController ()

@end

@implementation DetailsController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=NO;
    int i=0;
    for(NSString *str in self.listOfChoices)
    {
        i++;
        UILabel *labelWithChoice=[[UILabel alloc]initWithFrame:CGRectMake(0, i*50+30, 200, 40)];
        labelWithChoice.backgroundColor=[UIColor colorWithWhite:0.0 alpha:0.2];
        
        labelWithChoice.text=str;
        [self.view addSubview:labelWithChoice];
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
