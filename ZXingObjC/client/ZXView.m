//
//  ZXView.m
//  ZXingObjC
//
//  Created by Brown, Randall on 2/4/15.
//  Copyright (c) 2015 zxing. All rights reserved.
//

#import "ZXView.h"
#import "ZXBitMatrix.h"

@implementation ZXView

- (instancetype)initWithFrame:(CGRect)frame bitMatrix:(ZXBitMatrix*)bitMatrix
{
    self = [super initWithFrame:frame];
    if (self) {
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
                [self addSubview:pixelView];
            }
            else {
                pixelView.backgroundColor = [UIColor whiteColor];
            }
            
        }
    }
    return self;
}

-(NSArray*)lines {
    return [self subviews];
}

@end
