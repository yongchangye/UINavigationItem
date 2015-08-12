//
//  MyControl.m
//  2UITextField_收键盘
//
//  Created by LZXuan on 14-5-12.
//  Copyright (c) 2014年 轩哥. All rights reserved.
//

#import "MyControl.h"
/*
 这个类就可以为我们专门来创建一些基本的控件，那么如果要创建Label button textField 就可以通过这个类来创建
 这个类好像一个工厂一样专门生产一些基本控件
 类似于工厂设计模式
 */
@implementation MyControl
+ (UILabel *)creatLabelWithFrame:(CGRect)frame text:(NSString *)text{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = text;
    label.backgroundColor = [UIColor clearColor];
    
    return [label autorelease];
}
+ (UIButton *)creatButtonWithFrame:(CGRect)frame title:(NSString *)title target:(id)target action:(SEL)sel tag:(NSInteger)tag{
    
    UIButton *button= [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = frame;
    button.tag = tag;
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    return  button;
}
+ (UITextField *)creatTextFieldWithFrame:(CGRect)frame placeHolder:(NSString *)string delegate:(id<UITextFieldDelegate>)delegate tag:(NSInteger)tag{
    
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    //设置风格类型
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = string;
    //设置代理
    textField.delegate = delegate;
    //设置tag值
    textField.tag = tag;
    return [textField autorelease];
    
}

@end
