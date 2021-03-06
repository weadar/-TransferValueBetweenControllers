//
//  EmoInputNotificationViewController
//  控制器间的传值
//
//  Created by Emo_Lin on 14/10/24.
//  Copyright © 2014年 Emo Lin. All rights reserved.
//

#import "EmoInputNotificationViewController.h"
#import "EmoNotificationViewController.h"


@interface EmoInputNotificationViewController ()
@property (nonatomic , strong) UITextField *ShareInputField;
@property (nonatomic , strong) UIButton *ShareInputBtn;
@end

@implementation EmoInputNotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor  = [UIColor cyanColor];
    self.navigationItem.title = @"通知传值";
    
    CGFloat width = 200;
    CGFloat height = 30;
    CGFloat topMargin = 100;
    CGFloat YMargin = 80;
    
    self.ShareInputField = [[UITextField alloc] initWithFrame:CGRectMake(self.view.bounds.size.width / 2 - width / 2,topMargin, width, height)];
    self.ShareInputField.text = self.attributesString;
    self.ShareInputField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.ShareInputField];
    
    self.ShareInputBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.ShareInputBtn.frame = CGRectMake(self.view.bounds.size.width / 2 - width / 2,topMargin+YMargin, width, height);
    [self.ShareInputBtn setTitle:@"开始传值" forState:UIControlStateNormal];
    [self.ShareInputBtn setTitle:@"正在传值中" forState: UIControlStateHighlighted];
    [self.ShareInputBtn addTarget:self action:@selector(ShareInputClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.ShareInputBtn];
    
}

-(void) ShareInputClick {
    //第一步注册通知
    [[NSNotificationCenter defaultCenter]postNotificationName:@"labelTextNotification" object:self.ShareInputField.text];
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
