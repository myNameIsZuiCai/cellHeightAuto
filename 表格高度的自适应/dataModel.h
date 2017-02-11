//
//  dataModel.h
//  表格高度的自适应
//
//  Created by 上海均衡 on 16/9/18.
//  Copyright © 2016年 上海均衡. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
@interface dataModel : NSObject
@property(strong,nonatomic) NSString *name;
@property(strong,nonatomic) NSString *text;
@property(strong,nonatomic) NSString *icon;
@property(strong,nonatomic) NSString *picture;
@property(assign,nonatomic,getter=isVip) BOOL vip;
//cell的高度
@property(assign,nonatomic) CGFloat heights;
+(instancetype)statusWithDict:(NSDictionary *)dict;

@end
