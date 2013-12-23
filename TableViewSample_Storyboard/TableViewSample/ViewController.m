//
//  ViewController.m
//  TableViewSample
//
//  Created by MORITA NAOKI on 2013/12/21.
//  Copyright (c) 2013年 molabo. All rights reserved.
//

#import "ViewController.h"

#import "ChristmasCell.h"

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

- (void)cellButtonTapped:(id)sender
{
    NSLog(@"button Tapped");
}

#pragma mark - table view data source

// 列が何個あるか
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

// セルはこれです
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChristmasCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChristmasCell" forIndexPath:indexPath];
    cell.iconImageView.image = [UIImage imageNamed:@"sapin"];
    cell.titleLable.text = self.items[indexPath.row];
    [cell.button addTarget:self action:@selector(cellButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

#pragma mark - table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChristmasCell *cell = (ChristmasCell *)[tableView cellForRowAtIndexPath:indexPath];
    cell.titleLable.textColor = [UIColor greenColor];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
