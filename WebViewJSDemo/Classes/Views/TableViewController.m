//
//  TableViewController.m
//  ExpressDemo
//
//  Created by stlwtr on 2017/7/28.
//  Copyright © 2017年 cmcc. All rights reserved.
//

#import "TableViewController.h"
#import "WebViewController.h"
#import "WKWebViewController.h"

@interface TableViewController ()

@property (nonatomic, strong) NSArray *subviewControllers;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _subviewControllers = @[@"WebViewController", @"WKWebViewController"];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _subviewControllers.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WebCell" forIndexPath:indexPath];
    
    NSString *classString = self.subviewControllers[indexPath.row];
    cell.textLabel.text = classString;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *classString = self.subviewControllers[indexPath.row];
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:classString];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
