//
//  TDSItemListViewController.m
//  ToDoSample
//
//  Created by 森島航 on 2014/04/11.
//  Copyright (c) 2014年 wataru.morishima. All rights reserved.
//

#import "TDSItemListViewController.h"
#import "TDSCreateItemViewController.h"

@interface TDSItemListViewController () <TDSCreateItemViewControllerDelegate>

// 配列のプロパティ
@property NSMutableArray *items;

@end

@implementation TDSItemListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //「編集」ボタンの追加
    self.navigationItem.leftBarButtonItem =
        self.editButtonItem;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // セクションは１つなので、１を返す
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // リストのアイテム数を返す
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // UITableViewCellをデフォルトのスタイルで生成する
    UITableViewCell *cell = [[UITableViewCell alloc]
                             initWithStyle:UITableViewCellStyleDefault
                             reuseIdentifier:@"Cell"];
    // 配列からアイテムを取得してLabelのテキストに代入
    cell.textLabel.text =
        [self.items objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // 「Delete」ボタンが押されたら配列からアイテムを削除する
        [_items removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"CreateItemSegue"]){
        // 遷移先のTDSCreateItemViewControllerのインスタンスを取得する
        TDSCreateItemViewController *controller =
        (TDSCreateItemViewController *)[[[segue destinationViewController]
                                         viewControllers] objectAtIndex:0];
        // delegateプロパティにself(MasterViewController自身)を設定する
        controller.delegate = self;
    }
}

- (void)createItemViewControllerDidFinish:(TDSCreateItemViewController *)controller item:(NSString *)item
{
    // 配列がない場合は生成する
    if (!_items) {
        _items = [[NSMutableArray alloc] init];
    }
    // アイテムを先頭に追加する
    [_items insertObject:item atIndex:0];
    
    // UITableViewにUITableViewCellを追加する
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath]
                          withRowAnimation:UITableViewRowAnimationAutomatic];
    
    // TDSCreateItemViewControllerを閉じる
    [controller dismissViewControllerAnimated:YES completion:nil];
}

- (void)createItemViewControllerDidCancel:(TDSCreateItemViewController *)controller
{
    // TDSCreateItemViewControllerを閉じる
    [controller dismissViewControllerAnimated:YES completion:nil];
}

@end
