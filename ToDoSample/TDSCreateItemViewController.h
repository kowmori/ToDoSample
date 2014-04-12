//
//  TDSCreateItemViewController.h
//  ToDoSample
//
//  Created by 森島航 on 2014/04/11.
//  Copyright (c) 2014年 wataru.morishima. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TDSCreateItemViewControllerDelegate;

@interface TDSCreateItemViewController : UITableViewController

@property (weak, nonatomic) id<TDSCreateItemViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITextField *textField;

- (IBAction)saveButtonTapped:(id)sender;
- (IBAction)cancelButtonTapped:(id)sender;

@end

@protocol TDSCreateItemViewControllerDelegate <NSObject>

// 「Save」ボタンが押されたときに呼び出すメソッド
- (void)createItemViewControllerDidFinish:(TDSCreateItemViewController *)controller item:(NSString *)item;
// 「Cancel」ボタンが押されたときに呼び出すメソッド
- (void)createItemViewControllerDidCancel:(TDSCreateItemViewController *)controller;

@end
