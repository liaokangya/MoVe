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
@synthesize meetingFound = _meetingFound;
@synthesize meetingName = _meetingName;
@synthesize positionName = _positionName;
@synthesize departmentName = _departmentName;
@synthesize contentName = _contentName;

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
    
    self.meetingName.text = self.meetingFound.name;
    self.positionName.text = self.meetingFound.position;
    self.departmentName.text = self.meetingFound.department;
    self.contentName.text = self.meetingFound.content;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions

- (void)meetingDataChanged:(id)sender {
    self.meetingFound.name = self.meetingName.text;
    self.meetingFound.position = self.positionName.text;
    self.meetingFound.department = self.departmentName.text;
    self.meetingFound.content = self.contentName.text;
}

@end
