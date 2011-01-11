/*
 * AppController.j
 * CPTableView
 *
 * Created by You on January 10, 2011.
 * Copyright 2011, Your Company All rights reserved.
 */

@import <Foundation/CPObject.j>


@implementation AppController : CPObject
{
    CPScrollView scrollView;
    CPTableView tableView;
    CPArray data;
}

- (void)tableViewSelectionDidChange:(CPNotification)aNotification {
    alert("hello");
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    var theWindow = [[CPWindow alloc] initWithContentRect:CGRectMakeZero() styleMask:CPBorderlessBridgeWindowMask],
        contentView = [theWindow contentView];
    
    scrollView = [[CPScrollView alloc] initWithFrame:[contentView bounds]];
    tableView = [[CPTableView alloc] initWithFrame:CGRectMakeZero()];
    [tableView setUsesAlternatingRowBackgroundColors:YES];
    //[tableView setAutoresizingMask:CPViewMinXMargin | CPViewMaxXMargin | CPViewMinYMargin | CPViewMaxYMargin];
    
    data = [[CPArray alloc] init];
    [data addObject:@"test"];
    [data addObject:@"another 1"];
    
    var theColumn = [[CPTableColumn alloc] initWithIdentifier:@"theColumn"];
    [[theColumn headerView] setStringValue:@"The Column"];
    //[theColumn setMinWidth:300];
    [tableView addTableColumn:theColumn];
    //[theColumn setTableView:tableView];
    
    [scrollView setDocumentView:tableView];
    
    [tableView setDataSource:self];
    [tableView setDelegate:self];

    [contentView addSubview:scrollView];
    [theWindow orderFront:self];

    // Uncomment the following line to turn on the standard menu bar.
    //[CPMenu setMenuBarVisible:YES];
}

- (int)numberOfRowsInTableView:(CPTableView)aTableView {
    return [data count];
}

- (id)tableView:(CPTableView)aTableView objectValueForTableColumn:(CPTableColumn)aTableColumn row:(int)rowIndex {
    return [data objectAtIndex:rowIndex];
}

@end
