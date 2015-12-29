//
//  ViewController.m
//  OC调用JS
//
//  Created by caolipeng on 15/12/29.
//  Copyright © 2015年 caolipeng. All rights reserved.
//

#import "OCViewController.h"

@interface OCViewController ()<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation OCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**
     *  加载网页
     *
     *  @return return value description
     */
    NSString *str = @"http://www.xianhua.cn/m/";
    NSURL *url = [NSURL URLWithString:str];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UIWebViewDelegate;
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    //修改头部标题
    NSString *str = @"document.getElementsByTagName('h1')[0].innerText = '就开始大空间回复';";
    [webView stringByEvaluatingJavaScriptFromString:str];
    
    
    //删除底部广告
    NSString *str2 = @"document.getElementsByClassName('detail_btns2')[0].remove();";
    [webView stringByEvaluatingJavaScriptFromString:str2];
    
    //修改底部标题
    NSString *str3 = @"document.getElementById('xiazaiapp').getElementsByTagName('a')[0].innerText = 'iCocos';";
    [webView stringByEvaluatingJavaScriptFromString:str3];
    
    
    /**
     *  document.getElementsByTagName('h1')[0].innerText = '就开始大空间回复';
     *  document.getElementsByClassName('detail_btns2')[0].remove();
     *  document.getElementById('xiazaiapp').getElementsByTagName('a')[0].innerText = 'iCocos';
     */
}


//- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
//{
//
//}


- (IBAction)dismiss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


@end
