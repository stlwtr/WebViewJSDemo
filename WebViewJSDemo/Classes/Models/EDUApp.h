//
//  EDUApp.h
//  ExpressDemo
//
//  Created by stlwtr on 2017/7/27.
//  Copyright © 2017年 cmcc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol EDUJSExport <JSExport>

- (void)login;

JSExportAs(login, - (void)login:(NSString *)string password:(NSString *)password);


@end

@interface EDUApp : NSObject<EDUJSExport>

@end
