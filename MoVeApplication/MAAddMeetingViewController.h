//
//  MAAddMeetingViewController.h
//  MoVeApplication
//
//  Created by SCB on 12/7/13.
//  Copyright (c) 2013 SCB. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MeetingProtocol <NSObject>

- (void)meetingSaved;
- (void)canceled;

@end

@interface MAAddMeetingViewController : UIViewController

@property (strong, nonatomic) id <MeetingProtocol> delegate;
@property (strong, nonatomic) IBOutlet UITextField *mName;
@property (strong, nonatomic) IBOutlet UITextField *mPosition;
@property (strong, nonatomic) IBOutlet UITextField *mDepartment;
@property (strong, nonatomic) IBOutlet UITextField *mContent;
- (IBAction)saveButtonClicked:(id)sender;
- (IBAction)cancelButtonClicked:(id)sender;


@end
