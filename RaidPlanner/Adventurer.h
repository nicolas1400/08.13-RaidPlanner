//
//  Adventurer.h
//  RaidPlanner
//
//  Created by Nicolas Semenas on 13/08/14.
//  Copyright (c) 2014 Nicolas Semenas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Raid;

@interface Adventurer : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * species;
@property (nonatomic, retain) NSSet *raids;
@end

@interface Adventurer (CoreDataGeneratedAccessors)

- (void)addRaidsObject:(Raid *)value;
- (void)removeRaidsObject:(Raid *)value;
- (void)addRaids:(NSSet *)values;
- (void)removeRaids:(NSSet *)values;

@end
