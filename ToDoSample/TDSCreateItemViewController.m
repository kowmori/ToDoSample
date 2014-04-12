//
//  TDSCreateItemViewController.m
//  ToDoSample
//
//  Created by 森島航 on 2014/04/11.
//  Copyright (c) 2014年 wataru.morishima. All rights reserved.
//

#import "TDSCreateItemViewController.h"

@implementation TDSCreateItemViewController

- (IBAction)saveButtonTapped:(id)sender {
    // createItemViewControllerDidFinish:メソッドを呼び出す
    if([self.delegate respondsToSelector:@selector(createItemViewControllerDidFinish:item:)]){
        // 入力文字列を取得する
        NSString *item = self.textField.text;
        [self.delegate createItemViewControllerDidFinish:self item:item];
    }
}

- (IBAction)cancelButtonTapped:(id)sender {
    // createItemViewControllerDidCancel:メソッドを呼び出す
    if([self.delegate respondsToSelector:@selector(createItemViewControllerDidCancel:)]){
        [self.delegate createItemViewControllerDidCancel:self];
    }
}

@end
