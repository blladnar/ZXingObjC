//
//  ZXView.h
//  ZXingObjC
//
//  Created by Brown, Randall on 2/4/15.
//  Copyright (c) 2015 zxing. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZXBitMatrix;

@interface ZXView : UIView
- (instancetype)initWithFrame:(CGRect)frame bitMatrix:(ZXBitMatrix*)bitMatrix;

@property (nonatomic, readonly) NSMutableArray *lines;
@end
