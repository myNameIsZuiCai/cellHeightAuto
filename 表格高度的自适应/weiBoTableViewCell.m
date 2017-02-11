//
//  weiBoTableViewCell.m
//  表格高度的自适应
//
//  Created by 上海均衡 on 16/9/18.
//  Copyright © 2016年 上海均衡. All rights reserved.
//

#import "weiBoTableViewCell.h"
#import "dataModel.h"
@interface weiBoTableViewCell()
@property (strong, nonatomic) IBOutlet UIImageView *headImage;
@property (strong, nonatomic) IBOutlet UILabel *nickName;

@property (strong, nonatomic) IBOutlet UIImageView *vipImage;

@property (strong, nonatomic) IBOutlet UILabel *contentLabel;
@property (strong, nonatomic) IBOutlet UIImageView *picture;


@end
@implementation weiBoTableViewCell
-(void)awakeFromNib{
    [super awakeFromNib];
    /*
        1、设置label每一行文字的最大高度
        2、为了保证计算出来的数值跟真正显示出来的数值一致
     */
    self.contentLabel.preferredMaxLayoutWidth=[UIScreen mainScreen].bounds.size.width-20;
}
+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *strID=@"hello";
    weiBoTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:strID];
    //如果没有创建成功
    if (cell==nil) {
        cell=[[[NSBundle mainBundle] loadNibNamed:@"weiBoTableViewCell" owner:self options:nil] lastObject];
    }
    return  cell;
}
-(void)setDmodel:(dataModel *)dmodel{
    _dmodel=dmodel;
    /*
     @property(strong,nonatomic) NSString *name;
     @property(strong,nonatomic) NSString *text;
     @property(strong,nonatomic) NSString *icon;
     @property(strong,nonatomic) NSString *picture;
     @property(assign,nonatomic) BOOL vip;
     */
    if (dmodel.isVip) {
        self.nickName.textColor=[UIColor orangeColor];
        self.vipImage.hidden=NO;
    }else{
        self.nickName.textColor=[UIColor blackColor];
        self.vipImage.hidden=YES;
    }
    
    self.headImage.image=[UIImage imageNamed:dmodel.icon];
    self.nickName.text=dmodel.name;
    self.contentLabel.text=dmodel.text;
    if (dmodel.picture) {
        self.picture.hidden=NO;
        self.picture.image=[UIImage imageNamed:dmodel.picture];
    }else{
        self.picture.hidden=YES;
        //如果没有配图
    }
    //先强制布局
    [self layoutIfNeeded];
    //计算cell的高度
    if (self.picture.hidden) {
        //如果没有配图
        dmodel.heights=CGRectGetMaxY(self.contentLabel.frame)+10;
        NSLog(@"#######%f",dmodel.heights);
    }else{
        //如果有配图
        dmodel.heights=CGRectGetMaxY(self.picture.frame)+10;
        NSLog(@"!!!!!!!%f",dmodel.heights);

    }
    
    [UIView animateWithDuration:2.0 animations:^{
        [self layoutIfNeeded];
    }];
    
}
@end
