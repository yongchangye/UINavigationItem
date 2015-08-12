//
//  ThirdViewController.m
//  UINavigationController
//
//  Created by LZXuan on 14-5-15.
//  Copyright (c) 2014年 轩哥. All rights reserved.
//

#import "ThirdViewController.h"
#import "MyControl.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController
- (void)dealloc{
    NSLog(@"third dealloc");
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
    self.view.backgroundColor = [UIColor purpleColor];
    NSArray *titles = @[@"pop到上一级",@"返回指定视图",@"pop到第一张"];
    for (int i = 0; i < 3; i++) {
        UIButton *button  = [MyControl creatButtonWithFrame:CGRectMake(10, 100+40*i, 300, 30) title:titles[i] target:self action:@selector(btnClick:) tag:301+i];
        button.backgroundColor = [UIColor grayColor];
        [self.view addSubview:button];
    }
    self.navigationItem.title = @"Third";
}
- (void)btnClick:(UIButton *)button{
    switch (button.tag) {
        case 301:
        {
            //只有添加到(push)导航控制器中之后 才能获取试图控制所在导航控制器的地址
            //返回上一级
            [self.navigationController popViewControllerAnimated:YES];
        }
            break;
        case 302:
        {
            //返回指定的视图
            //获取导航控制器的一个存放子视图控制器的数组(容器)
            NSArray *array = self.navigationController.viewControllers;
            [self.navigationController popToViewController:array[0] animated:YES];
            
        }
            break;
        case 303:
        {
            //返回到第一个视图 (最底层)
            //容器中间的视图 会从容器中移除 会出栈
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
            break;
            
        default:
            break;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
