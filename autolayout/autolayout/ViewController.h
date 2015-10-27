//
//  ViewController.h
//  autolayout
//
//  Created by fan on 10/8/15.
//  Copyright © 2015 fanfan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController < UIScrollViewDelegate>

@property (nonatomic,  weak) IBOutlet   UIButton        *btn;
@property (nonatomic,  weak) IBOutlet   UIDatePicker    *timePicker;
@property (nonatomic,  strong) IBOutlet   UILabel         *lb;
@property (nonatomic,  weak) IBOutlet   UITextField     *tf;
@property (weak) UIView *selfview;

@end


@interface ALScrollView : UIScrollView

@end

