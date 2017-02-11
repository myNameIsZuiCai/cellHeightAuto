//
//  dataModel.m
//  表格高度的自适应
//
//  Created by 上海均衡 on 16/9/18.
//  Copyright © 2016年 上海均衡. All rights reserved.
//

#import "dataModel.h"

@implementation dataModel
+(instancetype)statusWithDict:(NSDictionary *)dict{
    dataModel *model=[[dataModel alloc]init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}
@end
