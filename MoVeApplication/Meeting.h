//
//  Meeting.h
//  MoVeApplication
//
//  Created by SCB on 12/7/13.
//  Copyright (c) 2013 SCB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Meeting : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * position;
@property (nonatomic, retain) NSString * department;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSString * content;
@property (nonatomic, retain) NSString * picture;

@end
