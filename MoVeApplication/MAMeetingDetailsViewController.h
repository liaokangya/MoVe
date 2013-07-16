//
//  MAMeetingDetailsViewController.h
//  MoVeApplication
//
//  Created by SCB on 16/7/13.
//  Copyright (c) 2013 SCB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Meeting.h"

@interface MAMeetingDetailsViewController : UIViewController

@property Meeting *meetingFound;
@property (strong, nonatomic) IBOutlet UITextField *meetingName;
@property (strong, nonatomic) IBOutlet UITextField *positionName;
@property (strong, nonatomic) IBOutlet UITextField *departmentName;
@property (strong, nonatomic) IBOutlet UITextField *contentName;

- (IBAction)meetingDataChanged:(id)sender;

@end
