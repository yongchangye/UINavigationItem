//
//  SecondViewController.m
//  UINavigationController
//
//  Created by LZXuan on 14-5-15.
//  Copyright (c) 2014年 轩哥. All rights reserved.
//

#import "SecondViewController.h"
#import "MyControl.h"
#import "ThirdViewController.h"
@interface SecondViewController ()

@end

@implementation SecondViewController
- (void)dealloc{
    NSLog(@"second dealloc");
    [super dealloc];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor cyanColor];
    
    NSArray *titles = @[@"push到下一张",@"返回上一张"];
    for (int i = 0; i < 2; i++) {
        UIButton *button  = [MyControl creatButtonWithFrame:CGRectMake(10, 100+40*i, 300, 30) title:titles[i] target:self action:@selector(btnClick:) tag:101+i];
        button.backgroundColor = [UIColor grayColor];
        [self.view addSubview:button];
    }
    
    self.navigationItem.title = @"Second";
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(itemClick)];
    self.navigationItem.leftBarButtonItem = item;
    //这样的话 系统自带的back 按钮就会被替换
    [item release];
}
- (void)itemClick{
    //返回到上一级
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)btnClick:(UIButton *)button{
    switch (button.tag) {
        case 101:
        {
            ThirdViewController *tvc = [[ThirdViewController alloc] init];
            //获取导航地址
            //跳转到下一张
            [self.navigationController pushViewController:tvc animated:YES];
            [tvc release];
        }
            break;
        case 102:{
            //返回上一层
            //出栈/弹栈
            //从容器中移除
            //-1操作
            [self.navigationController popViewControllerAnimated:YES];
        }
            break;
    }
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
