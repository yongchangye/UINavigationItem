//
//  MyControl.h
//  2UITextField_收键盘
//
//  Created by LZXuan on 14-5-12.
//  Copyright (c) 2014年 轩哥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyControl : NSObject
+ (UILabel *)creatLabelWithFrame:(CGRect)frame
                            text:(NSString *)text ;
+ (UIButton *)creatButtonWithFrame:(CGRect)frame
                             title:(NSString *)title
                            target:(id)target
                            action:(SEL)sel
                               tag:(NSInteger)tag;
+ (UITextField *)creatTextFieldWithFrame:(CGRect)frame
                             placeHolder:(NSString *)string
                                delegate:(id <UITextFieldDelegate>)delegate
                                     tag:(NSInteger)tag;
@end
