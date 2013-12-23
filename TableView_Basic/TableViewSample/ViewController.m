//
//  ViewController.m
//  TableViewSample
//
//  Created by MORITA NAOKI on 2013/12/21.
//  Copyright (c) 2013年 molabo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *contentTableView;

@property (strong, nonatomic) NSArray *items; // テーブルに表示する文字列の配列

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.items = @[@"えび",@"まぐろ",@"いか",@"サーモン",@"さば"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 列が何個あるか
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

// セルはこれです
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = self.items[indexPath.row];
    return cell;
}

@end
