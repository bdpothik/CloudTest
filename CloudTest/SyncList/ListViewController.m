//
//  ListViewController.m
//  CloudTest
//
//  Created by Hasan Ibna Akbar on 3/22/15.
//  Copyright (c) 2015 Hasan Ibna Akbar. All rights reserved.
//

#import "ListViewController.h"
#import "ListViewCell.h"

@interface ListViewController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *listTableView;

@property (strong, nonatomic) NSArray *listData;

@end

@implementation ListViewController

#pragma mark - View Life-cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.listData = [self getListData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Methods
- (NSArray *)getListData {

    return @[@"hhh.png", @"hello.png"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.listData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *cellString = @"ListViewCell";
    ListViewCell *cell = (ListViewCell *)[tableView dequeueReusableCellWithIdentifier:cellString];
    
    cell.itemName.text = self.listData[indexPath.row];
    
    return cell;
}

@end
