//
//  ViewController.m
//  Aug2
//
//  Created by Piyal Basu on 8/2/12.
//  Copyright (c) 2012 Concentric. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (id) initWithNibName: (NSString *) nibNameOrNil bundle: (NSBundle *) nibBundleOrNil
{
    self = [super initWithNibName: nibNameOrNil bundle: nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle



- (void) loadView
{
	NSBundle *bundle = [NSBundle mainBundle];
	NSString *fileName = [bundle pathForResource: @"index" ofType: @"html"];
	NSData *data = [NSData dataWithContentsOfFile: fileName];
	
	UIWebView *webView = [[UIWebView alloc] initWithFrame: [UIScreen mainScreen].applicationFrame];

    
	if (data == nil) {
		[webView loadHTMLString: @"Could not load page." baseURL: nil];
	} else {
		[webView loadData: data
                 MIMEType: @"text/html"
         textEncodingName: @"utf-8"
                  baseURL: [NSURL URLWithString: @"http://maps.google.com/"]
         ];
	}
    
	self.view = webView;
}


/*
 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void) viewDidLoad
 {
 [super viewDidLoad];
 }
 */

- (void) viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL) shouldAutorotateToInterfaceOrientation: (UIInterfaceOrientation) interfaceOrientation
{
    // Return YES for supported orientations
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
	return YES;
}
@end
