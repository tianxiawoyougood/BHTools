//
//  BHTextLabel.h
//  BHTools
//
//  Created by sunbinhua on 2019/3/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BHTextLabel : UITextView
@property (nonatomic, strong) NSDictionary *attributes;
@property (nonatomic, copy) NSString *textStr;


/**
 排除区域
 
 @param rect 排除的区域
 */
- (void)exclusionFrame:(CGRect)rect;

@end

NS_ASSUME_NONNULL_END
