//
//  XMGStatusesViewController.m
//  备课03-不等高的cell-非代码
//
//  Created by MJ Lee on 15/6/2.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "XMGStatusesViewController.h"
#import "dataModel.h"
#import "weiBoTableViewCell.h"

@interface XMGStatusesViewController ()
@property (strong, nonatomic) NSArray *statuses;
@end

@implementation XMGStatusesViewController


- (NSArray *)statuses
{
    if (_statuses == nil) {
        // 加载plist中的字典数组
        NSString *path = [[NSBundle mainBundle] pathForResource:@"statuses.plist" ofType:nil];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        
        // 字典数组 -> 模型数组
        NSMutableArray *statusArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            dataModel *status = [dataModel statusWithDict:dict];
            [statusArray addObject:status];
        }
        
        _statuses = statusArray;
    }
    return _statuses;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.statuses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    weiBoTableViewCell *cell = [weiBoTableViewCell cellWithTableView:tableView];
    cell.dmodel = self.statuses[indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    dataModel *model=self.statuses[indexPath.row];
    return model.heights;
}
//估计高度  有了这个方法，会先调用cellForRowAtIndexPath再调用heightForRowAtIndexPath
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  200;
}

@end
