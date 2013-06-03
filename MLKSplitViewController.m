//
//  MLKSplitViewController.m
//  CustomSplitView
//
//  Created by NagaMalleswar on 26/05/13.
//  Copyright (c) 2013 MyOrganization. All rights reserved.
//

#import "MLKSplitViewController.h"

#define MASTER_VIEW_WIDTH   300
#define SPLIT_GAP           1.5

@interface MLKSplitViewController ()

@property(nonatomic,retain) NSArray *viewControllers;

@end

@implementation MLKSplitViewController

@synthesize viewControllers;

- (id)initWithViewControllers:(NSArray *)splitViewControllers
{
    self = [super init];
    
    if (self)
	{
		self.viewControllers = splitViewControllers;
    }
    
    return self;
}

#pragma mark -
#pragma mark View Life Cycle

- (void)loadView
{
    self.view = [[UIView alloc] init];
    self.view.backgroundColor = [UIColor blackColor];
    
    for (UIViewController *viewController in self.viewControllers)
	{
		[self.view addSubview:viewController.view];
		[viewController viewDidLoad];
	}
}

- (void)viewDidLoad
{
	[super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
    	
	for (UIViewController *viewController in self.viewControllers)
	{
		[viewController viewDidAppear:animated];
	}
    
	[self layoutSubviews];
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
		
	for (UIViewController *viewController in self.viewControllers)
	{
		[viewController viewWillAppear:animated];
	}
}

#pragma mark -
#pragma mark - UI Orientation

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
	for (UIViewController *viewController in self.viewControllers)
	{
		[viewController didRotateFromInterfaceOrientation:fromInterfaceOrientation];
	}
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    for (UIViewController *viewController in self.viewControllers)
	{
		[viewController willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
	}
}

- (void)willAnimateRotationToInterfaceOrientation: (UIInterfaceOrientation)interfaceOrientation duration:(NSTimeInterval)duration
{
	[super willAnimateRotationToInterfaceOrientation:interfaceOrientation duration:duration];
    [self layoutSubviews];
}

- (void)layoutSubviews
{
	UIViewController *masterViewController = [self.viewControllers objectAtIndex:0];
	UIViewController *detailViewController = [self.viewControllers objectAtIndex:1];
		
	masterViewController.view.frame = CGRectMake(0,0, MASTER_VIEW_WIDTH, self.view.bounds.size.height);
    detailViewController.view.frame = CGRectMake(MASTER_VIEW_WIDTH + SPLIT_GAP, 0, self.view.bounds.size.width - MASTER_VIEW_WIDTH - SPLIT_GAP, self.view.bounds.size.height);
}

@end
