//
//  ViewController.m
//  JS调用OC
//
//  Created by caolipeng on 15/12/29.
//  Copyright © 2015年 caolipeng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (nonatomic, weak) UIImagePickerController *picker;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"iCocos.html" withExtension:nil];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//=================================================================================================

#pragma mark 打开相册对应的方法

//=================================================================================================
- (void)OpenCamera{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    self.picker = picker;
    [self presentViewController:picker animated:YES completion:nil];
}



//=================================================================================================

#pragma mark 网络请求成功调用

//=================================================================================================
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSLog(@"%@", request.URL.absoluteString);
    
    //获取URL
    NSString *requetsUrl = request.URL.absoluteString;
    
    
    //截取方法
    NSRange range = [requetsUrl rangeOfString:@"icocos:///"];
    
    NSInteger loc = range.location;
    
    NSLog(@"%ld",(long)NSNotFound);
    NSLog(@"%ld", (long)loc);
    
    if (loc!=NSNotFound) {
        NSString *str = [requetsUrl substringFromIndex:loc+range.length];
        NSLog(@"%@", str);
        
        /**
         *  包装方法
         */
        SEL method = NSSelectorFromString(str);
        [self performSelector:method];
    }
    
    return YES;
}

/**
 *  获取图片并设置
 */
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    NSLog(@"%@", image);
    
    [self.picker dismissViewControllerAnimated:YES completion:nil];
    
    self.imageView.image = image;
}

@end
