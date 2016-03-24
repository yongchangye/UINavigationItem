//
//  FirstViewController.m
//  UINavigationController
//
//  Created by LZXuan on 14-5-15.
//  Copyright (c) 2014年 轩哥. All rights reserved.
//

#import "FirstViewController.h"
#import "MyControl.h"
#import "SecondViewController.h"
@interface FirstViewController ()

@end

@implementation FirstViewController

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
    self.view.backgroundColor = [UIColor redColor];
    //添加修改测试
    //最上方有一个导航条  这个导航条 默认大小 320*44  y坐标从20开始
    
    //状态栏 是320 * 20  状态栏在导航条上方
    
    //导航中所有的子视图控制器都共享同一个导航条
    //所以我们在视图控制器上添加子视图的时候要注意避开 导航条
    //从y坐标  64开始
    UIButton *button  = [MyControl creatButtonWithFrame:CGRectMake(10, 100, 300, 30) title:@"push到下一张" target:self action:@selector(btnClick:) tag:101];
    button.backgroundColor = [UIColor grayColor];
    [self.view addSubview:button];
    
    /*
     UINavigationBar 是所有的子视图控制器共享一个
     UINavigationItem 每一个子视图控制器 都有自己的内容 这个是每一张子视图控制器中导航条上的内容  这些内容 每张子视图控制器是不一样的  不共享
     
     UINavigationItem就是导航条的描述 导航条的内容 这些内容不属于导航控制器 属于各自的子视图控制器的
     UINavigationBar才属于导航控制器
     //导航条就是内容的载体
     */
    //设置 每一张子视图控制器导航条上的标题
   // self.title = @"First";//下一张的系统自带的返回按钮标题会改成First
    //navigationItem 是子视图控制器自己的
    //得到navigationItem的地址
    self.navigationItem.title = @"First";//这是一个字符串标题 放在导航条的中间位置
   
    //设置标题视图
    
    UIView *greenView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    greenView.backgroundColor = [UIColor greenColor];
    self.navigationItem.titleView = greenView;//这里有+1操作
    [greenView release];
    
    //设置导航条上的按钮
    //系统自带的按钮没有了边框 和圆角
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(itemClick:)];
    item1.tag = 1001;//UIBarButtonItem  也有tag来区分
    //设置左侧按钮 setLeftBarButtonItem这个方法一次只能设置一个
    //self.navigationItem.leftBarButtonItem = item1;//计数器+1操作
    //[item1 release];
    //设置文字按钮
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithTitle:@"点我" style:UIBarButtonItemStylePlain target:self action:@selector(itemClick:)];
    item2.tag = 1002;
    
    
    //设置自定义的按钮 (开发中常常用到)
    //首先可以创建一个UIbutton
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button3.frame = CGRectMake(0, 0, 30, 30);
    [button3 setBackgroundImage:[UIImage imageNamed:@"itemImage"] forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item3 = [[UIBarButtonItem alloc] initWithCustomView:button3];
    
    NSArray *array = @[item1,item2,item3];
    
    //设置多个左侧按钮 传一个数组地址
    self.navigationItem.leftBarButtonItems =array;
    [item1 release];//可以release了
    [item2 release];
    [item3 release];
    
    //设置右侧按钮
    UIBarButtonItem *item4 = [[UIBarButtonItem alloc] initWithTitle:@"右侧" style:UIBarButtonItemStylePlain target:self action:@selector(itemClick:)];
    item4.tag = 1004;
    self.navigationItem.rightBarButtonItem = item4;
    [item4 release];
    
    
}
- (void)onClick:(UIButton *)button{
    NSLog(@"自定义的按钮被点击了");
}

- (void)itemClick:(UIBarButtonItem *)item{
    switch (item.tag) {
        case 1001:
            NSLog(@"系统自带的被点击了");
            break;
        case 1004://右侧按钮调用
        {
            SecondViewController *svc = [[SecondViewController alloc] init];
            [self.navigationController pushViewController:svc animated:YES];
            [svc release];
        }
            break;
            
        default:
            break;
    }
}

- (void)btnClick:(UIButton *)button{
    //创建一张新的视图
    SecondViewController *svc = [[SecondViewController alloc] init];
  
    [self.navigationController pushViewController:svc animated:YES];//引用计数+1
    //在切换的时候 一般视图控制器视图是clearColor 这个时候iOS7会出现 卡壳的现象 (iOS7是没有的)
    //如果解决 给第二张视图加一个颜色
    [svc release];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
