//
//  DetailViewController.m
//  RaidPlanner
//
//  Created by Nicolas Semenas on 13/08/14.
//  Copyright (c) 2014 Nicolas Semenas. All rights reserved.
//

#import "DetailViewController.h"
#import "Raid.h"
#import "Adventurer.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@end

@implementation DetailViewController



- (IBAction)onAddRaid:(id)sender {
    Raid * raid = [self raid];
    [self.adventurer addRaidsObject:raid];
    [self.adventurer.managedObjectContext save:nil];
}


-(Raid *) raid{
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Raid"];
    request.predicate = [NSPredicate predicateWithFormat:@"date = %@",self.datePicker.date];
    NSArray * results = [self.adventurer.managedObjectContext executeFetchRequest:request error:nil];
    if (results.count > 0 ){
        return [results objectAtIndex:0];
    }
    Raid * raid = [NSEntityDescription insertNewObjectForEntityForName:@"Raid" inManagedObjectContext:self.adventurer.managedObjectContext];
    raid.date = self.datePicker.date;
    
    return raid;
}



@end
