//
//  MasterViewController.m
//  RaidPlanner
//
//  Created by Nicolas Semenas on 13/08/14.
//  Copyright (c) 2014 Nicolas Semenas. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

#import "Adventurer.h"
#import "Raid.h"

@interface MasterViewController ()

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MasterViewController

-(void)viewDidLoad{
    
    [super viewDidLoad];
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"Adventurer"];
    request.sortDescriptors = [NSArray arrayWithObjects:[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES], nil];
   
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:self.managedObjectContext  sectionNameKeyPath:@"species" cacheName:@"RaidPlanner" ];
    
    self.fetchedResultsController.delegate = self;
    
    [self.fetchedResultsController performFetch:nil];
    
}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.fetchedResultsController.sections.count;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [[self.fetchedResultsController.sections objectAtIndex:section]name];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Adventurer *adventurer = [self.fetchedResultsController objectAtIndexPath:indexPath];
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = adventurer.name;
    cell.detailTextLabel.text = [NSNumber numberWithInt:adventurer.raids.count].description;
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [[self.fetchedResultsController.sections objectAtIndex:section]numberOfObjects];
    
}



- (IBAction)addNewAdventurerName:(UITextField *)sender {
    
    NSArray *species = [NSArray arrayWithObjects:@"Human",@"Orc",@"Elf",@"Hobbit",nil];
    
    Adventurer * adventurer =[NSEntityDescription insertNewObjectForEntityForName:@"Adventurer" inManagedObjectContext:self.managedObjectContext];
    adventurer.name =sender.text;
    adventurer.species = [species objectAtIndex:arc4random()%species.count];
    [self.managedObjectContext save:nil];
    sender.text = nil;
    [sender resignFirstResponder];
    
}


-(void) controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath{
    
    [self.tableView reloadData];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    DetailViewController *dvc = segue.destinationViewController;
    dvc.adventurer = [self.fetchedResultsController objectAtIndexPath:self.tableView.indexPathForSelectedRow];
    
}

@end
