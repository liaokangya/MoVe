//
//  MAViewController.m
//  MoVeApplication
//
//  Created by SCB on 12/7/13.
//  Copyright (c) 2013 SCB. All rights reserved.
//

#import "MAViewController.h"
#import "MAAppDelegate.h"
#import "Meeting.h"
#import "MAAddMeetingViewController.h"

@interface MAViewController ()
@property(nonatomic, weak)MAAppDelegate *delegate;
@property(nonatomic, strong)NSArray *meetings;

@end

@implementation MAViewController

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
    self.delegate = [[UIApplication sharedApplication] delegate];
    [self loadData];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadData {
    NSManagedObjectContext *moc = self.delegate.managedObjectContext;
    NSFetchRequest *fr = [[NSFetchRequest alloc] initWithEntityName:@"Meeting"];
    
    NSError *error;
    self.meetings = [moc executeFetchRequest:fr error:&error];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.meetings count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"CellID";
    UITableViewCell *cell;
    
    cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    Meeting *m = [self.meetings objectAtIndex:indexPath.row];
    
    cell.textLabel.text = m.name;
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"addMeeting"]) {
        MAAddMeetingViewController *vc = [segue destinationViewController];
        vc.delegate = self;
    }
}

- (void)meetingSaved {
    [self dismissViewControllerAnimated:YES completion:^{
        [self loadData];
        [self.tableView reloadData];
    }];
}

- (void)canceled {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //Delete element from array
        Meeting *deletedMeeting = [self.meetings objectAtIndex:indexPath.row];
        NSManagedObjectContext *moc = self.delegate.managedObjectContext;
        [moc deleteObject:deletedMeeting];
        
        NSError *error;
        if (![moc save:&error]) {
            NSLog(@"An error occurred while deleting the meeting from the database.");
        }
        
        [self loadData];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

@end
