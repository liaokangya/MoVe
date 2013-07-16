//
//  MAMeetingDetailsViewController.m
//  MoVeApplication
//
//  Created by SCB on 16/7/13.
//  Copyright (c) 2013 SCB. All rights reserved.
//

#import "MAMeetingDetailsViewController.h"

@interface MAMeetingDetailsViewController ()

@end

@implementation MAMeetingDetailsViewController
@synthesize meetingFound, meetingName, positionName, departmentName, contentName;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    meetingName.text = meetingFound.name;
    positionName.text = meetingFound.position;
    departmentName.text = meetingFound.department;
    contentName.text = meetingFound.content;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
