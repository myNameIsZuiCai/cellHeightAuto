//
//  weiBoTableViewCell.h
//  表格高度的自适应
//
//  Created by 上海均衡 on 16/9/18.
//  Copyright © 2016年 上海均衡. All rights reserved.
//

#import <UIKit/UIKit.h>
@class dataModel;

@interface weiBoTableViewCell : UITableViewCell
+(instancetype)cellWithTableView:(UITableView *)tabelView;
/*
 微博模型数据
 */
@property(strong,nonatomic)dataModel *dmodel;

@end
