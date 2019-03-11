//
//  BHTextLabel.m
//  BHTools
//
//  Created by sunbinhua on 2019/3/11.
//

#import "BHTextLabel.h"

@implementation BHTextLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.editable = NO;
        self.selectable = NO;
        self.bounces = NO;
        self.textContainer.lineBreakMode = NSLineBreakByTruncatingTail;
        self.textContainer.maximumNumberOfLines = 2;
        self.textContainer.lineFragmentPadding = 0;
        self.textContainerInset = UIEdgeInsetsMake(0, 0, 0, 0);//默认上边距不是0
        self.showsVerticalScrollIndicator = NO;
        self.userInteractionEnabled = NO;
        self.contentOffset = CGPointMake(0, 0);
    }
    return self;
}

- (void)exclusionFrame:(CGRect)rect {
    
    if (rect.size.width <= 0 || rect.size.height <= 0) {
        self.textContainer.exclusionPaths = @[];
        [self layoutIfNeeded];
        return;
    }
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, CGRectGetWidth(rect) + 5, CGRectGetHeight(rect))];
    self.textContainer.exclusionPaths = @[path];
    self.contentOffset = CGPointMake(0, 0);
    
    [self layoutIfNeeded];
}


#pragma mark - setter

- (void)setTextStr:(NSString *)textStr {
    _textStr = [textStr copy];
    
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:textStr attributes:self.attributes];
    [self.textStorage replaceCharactersInRange:NSMakeRange(0, 0) withAttributedString:attributedString];
}


#pragma mark - getter

- (NSDictionary *)attributes {
    if (!_attributes) {
        _attributes = @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size:13],
                        NSForegroundColorAttributeName: [UIColor blackColor],
                        };
    }
    return _attributes;
}


@end
