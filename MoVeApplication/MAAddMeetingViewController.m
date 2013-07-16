//
//  MAAddMeetingViewController.m
//  MoVeApplication
//
//  Created by SCB on 12/7/13.
//  Copyright (c) 2013 SCB. All rights reserved.
//

#import "MAAddMeetingViewController.h"
#import "MAAppDelegate.h"
#import "Meeting.h"

@interface MAAddMeetingViewController ()

@end

@implementation MAAddMeetingViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveButtonClicked:(id)sender {
    [self saveMeeting];
    [self.delegate meetingSaved];
}

- (IBAction)cancelButtonClicked:(id)sender {
    [self.delegate canceled];
}

- (void)saveMeeting {
    MAAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *moc = delegate.managedObjectContext;
    Meeting *meeting = [NSEntityDescription insertNewObjectForEntityForName:@"Meeting" inManagedObjectContext:moc];
    
    meeting.name = self.mName.text;
    meeting.position = self.mPosition.text;
    meeting.department = self.mDepartment.text;
    meeting.content = self.mContent.text;
    meeting.date = [NSDate date];
    
    NSError *error;
    if(![moc save:&error]) {
        NSLog(@"An error occurred while trying to save the data.");
    } 
}

@end
