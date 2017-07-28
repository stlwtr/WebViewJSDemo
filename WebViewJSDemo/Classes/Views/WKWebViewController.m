//
//  ViewController.m
//  ExpressDemo
//
//  Created by stlwtr on 2017/7/26.
//  Copyright © 2017年 cmcc. All rights reserved.
//

#import "WKWebViewController.h"
#import <WebKit/WebKit.h>

@interface WKWebViewController ()<WKUIDelegate, WKNavigationDelegate, WKScriptMessageHandler>

@property (nonatomic, strong) WKWebView *webView;

@end

@implementation WKWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"WKWebViewController";
    
    WKWebView *webView = [[WKWebView alloc] initWithFrame:CGRectZero];
    webView.UIDelegate = self;
    webView.navigationDelegate = self;
    [self.view addSubview:webView];
    _webView = webView;
    
    [webView evaluateJavaScript:@"navigator.userAgent" completionHandler:^(id result, NSError *error) {
        NSString *oldAgent = result;
        NSString *newAgent = [NSString stringWithFormat:@"%@; %@;", oldAgent, @"edu.wkwebview"];
        
        NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:newAgent, @"UserAgent", nil];
        [[NSUserDefaults standardUserDefaults] registerDefaults:dictionary];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [webView setCustomUserAgent:newAgent];
    }];
    
    [webView.configuration.userContentController addScriptMessageHandler:self name:@"eduapp"];
    
    webView.translatesAutoresizingMaskIntoConstraints = NO;
    NSString *formatString = @"H:|-(0)-[webView]-(0)-|";
    NSDictionary *views = NSDictionaryOfVariableBindings(webView);
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:formatString options:0 metrics:nil views:views];
    [self.view addConstraints:constraints];
    NSArray *constraints2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(20)-[webView]-|" options:0 metrics:nil views:views];
    [self.view addConstraints:constraints2];

    webView.backgroundColor = [UIColor redColor];
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"express" withExtension:@"html"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}


- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    
}

// TODO: call js function foo
- (void)foo {
    
}

@end
