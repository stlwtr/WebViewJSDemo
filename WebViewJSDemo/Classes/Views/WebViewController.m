//
//  WebViewController.m
//  ExpressDemo
//
//  Created by stlwtr on 2017/7/27.
//  Copyright © 2017年 cmcc. All rights reserved.
//

#import "WebViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "EDUApp.h"

@protocol EDUExport <JSExport>

- (void)login;

@end

@interface WebViewController ()<UIWebViewDelegate, EDUExport>

@property (nonatomic, strong) IBOutlet UIWebView *webView;
@property (nonatomic, strong) EDUApp *eduapp;
@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"WebViewController";
    
    _eduapp = [[EDUApp alloc] init];
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"express" withExtension:@"html"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    JSContext *context = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    context[@"eduapp"] = self;
}

- (void)login {
    NSLog(@"==== login ====");
}

// TODO: call js function foo
- (void)foo {
    
}

@end
