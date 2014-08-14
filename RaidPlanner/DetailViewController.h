//
//  DetailViewController.h
//  RaidPlanner
//
//  Created by Nicolas Semenas on 13/08/14.
//  Copyright (c) 2014 Nicolas Semenas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Adventurer.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Adventurer * adventurer;


@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
