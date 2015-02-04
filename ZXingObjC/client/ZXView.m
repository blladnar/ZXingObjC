//
//  ZXView.m
//  ZXingObjC
//
//  Created by Brown, Randall on 2/4/15.
//  Copyright (c) 2015 zxing. All rights reserved.
//

#import "ZXView.h"
#import "ZXBitMatrix.h"

@interface ZXView ()

@property (nonatomic, strong) NSMutableArray *lines;

@end

@implementation ZXView

- (instancetype)initWithFrame:(CGRect)frame bitMatrix:(ZXBitMatrix*)bitMatrix
{
    self = [super initWithFrame:frame];
    if (self) {
        _lines = [[NSMutableArray alloc] init];
        self.clipsToBounds = YES;
        int y = 0;
        for (int x = 0; x < bitMatrix.width; x++) {
            
            int width = 0;
            BOOL blackOrWhite = [bitMatrix getX:x y:y];
            
            while([bitMatrix getX:x y:y] == blackOrWhite) {
                width++;
                x++;
            }
            x--;
            
            CGRect pixelRect = CGRectMake(x-width + 1, y, width, bitMatrix.height);
            UIView *pixelView = [[UIView alloc] initWithFrame:pixelRect];
            
            
            if(blackOrWhite) {
                pixelView.backgroundColor = [UIColor blackColor];
                [_lines addObject:pixelView];
            }
            else {
                pixelView.backgroundColor = [UIColor whiteColor];
            }
            [self addSubview:pixelView];
        }
    }
    return self;
}

@end
