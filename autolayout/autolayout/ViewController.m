//
//  ViewController.m
//  autolayout
//
//  Created by fan on 10/8/15.
//  Copyright © 2015 fanfan. All rights reserved.
//

#import "ViewController.h"


@implementation ALScrollView : UIScrollView

- (BOOL)touchesShouldBegin:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event inContentView:(UIView *)view {
    if ([view isKindOfClass:[UILabel class]]) {
        return NO;
    }
    return [super touchesShouldBegin:touches withEvent:event inContentView:view];
}
//- (BOOL)touchesShouldCancelInContentView:(UIView *)view {
//    if ([view isKindOfClass:[UILabel class]]) {
//        return YES;
//    }
//    return [super touchesShouldCancelInContentView:view];
//}
@end



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.btn setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.timePicker setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    NSLayoutConstraint* lc = [NSLayoutConstraint constraintWithItem:self.btn attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.timePicker attribute:NSLayoutAttributeTop multiplier:1.0 constant:200.0];
    [self.view addConstraint:lc];
    
    _selfview = self.view;
    NSDictionary *viewDict = NSDictionaryOfVariableBindings(_btn, _timePicker,_selfview);
    viewDict = @{@"_btn":self.btn, @"_timePicker":self.timePicker};
    NSArray *lcs = nil;
    lcs = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[_btn(>=80)]-100-|" options:0 metrics:nil views:viewDict];
    [self.view addConstraints:lcs];
    lcs = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_btn(>=60)]-40-[_timePicker]" options:0 metrics:nil views:viewDict];
    [self.view addConstraints:lcs];
    lcs = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[_timePicker]-100-|" options:0 metrics:nil views:viewDict];
    [self.view addConstraints:lcs];
    
//    lc = [NSLayoutConstraint constraintWithItem:self.btn attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:100.0];
//    [self.view addConstraint:lc];
    
    {
        UIScrollView *sv = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 70, 60, 90)];
        sv.tag = 101;
        sv.backgroundColor = [UIColor greenColor];
        UIView *subv = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 280)];
        subv.backgroundColor = [UIColor darkGrayColor];
        [sv addSubview:subv];
        
        UIView *subv2 = [[UIView alloc] initWithFrame:CGRectMake(0, -10, 50, 10)];
        subv2.backgroundColor = [UIColor purpleColor];
        [sv addSubview:subv2];

        sv.contentInset = UIEdgeInsetsMake(10, 0, 0, 0);
        
        CGSize sz = sv.bounds.size;
        sv.contentSize = sz;
        
        [self.view addSubview:sv];
        
        [sv scrollRectToVisible:CGRectMake(0, 0, 60, 40) animated:YES];

        UILabel *lbv = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, 40, 30)];
        lbv.textColor = [UIColor whiteColor];
        lbv.backgroundColor = [UIColor redColor];
        lbv.text = @"ririri";
        [sv addSubview:lbv];
        
        NSDictionary *dic = NSDictionaryOfVariableBindings(lbv);
        [sv addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[lbv]-10-|" options:0 metrics: 0 views:dic]];
        [sv addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[lbv]|" options:0 metrics: 0 views:dic]];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [self.view addGestureRecognizer:tap];
    }
    
    {
        
        UIScrollView *sv = [[ALScrollView alloc] initWithFrame:CGRectMake(20, 270, 100, 90)];
        sv.tag = 102;
        sv.backgroundColor = [UIColor greenColor];
        
        UIView *subv = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 89)];
        subv.backgroundColor = [UIColor lightGrayColor];
        [sv addSubview:subv];
        
        UIView *subv2 = [[UIView alloc] initWithFrame:CGRectMake(5, -10, 60, 200)];
        subv2.backgroundColor = [UIColor purpleColor];
        [sv addSubview:subv2];
        
        self.lb = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, 40, 30)];
        self.lb.textColor = [UIColor whiteColor];
        self.lb.backgroundColor = [UIColor redColor];
        self.lb.text = @"ririri";

        [self.view addSubview:sv];
        [sv addSubview:self.lb];
        
        
        UIView *supv = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 89)];
        supv.backgroundColor = [UIColor blackColor];
        [self.view addSubview:supv];
        [supv addSubview:sv];
//        [supv addSubview:self.lb];
        
        UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"a"]];
//        [sv addSubview:image];
        
        UITapGestureRecognizer *lbtap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapLabel:)];
        [self.lb addGestureRecognizer:lbtap];
        self.lb.userInteractionEnabled = YES;
        sv.delegate = self;
        
        supv.translatesAutoresizingMaskIntoConstraints = NO;
        sv.translatesAutoresizingMaskIntoConstraints = NO;
        subv2.translatesAutoresizingMaskIntoConstraints = NO;
        image.translatesAutoresizingMaskIntoConstraints = NO;
        self.lb.translatesAutoresizingMaskIntoConstraints = NO;
        subv.translatesAutoresizingMaskIntoConstraints = NO;
        
        UILabel *lbv = self.lb;
        NSDictionary *dic = NSDictionaryOfVariableBindings(supv,sv,subv,subv2,lbv,image);
        NSArray *lcs = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[subv2(>=60)]-20-|" options:0 metrics:nil views:dic];
        [sv addConstraints:lcs];
        lcs = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[subv2(>=200)]-20-|" options:0 metrics:nil views:dic];
        [sv addConstraints:lcs];
        
        [sv addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[subv]|" options:0 metrics: 0 views:dic]];
        [sv addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[subv]|" options:0 metrics: 0 views:dic]];
        
        int i = 2;
        if (i == 0) {
             [sv addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[lbv]-10-|" options:0 metrics: 0 views:dic]];
             [sv addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[lbv]|" options:0 metrics: 0 views:dic]];
        } else if (i == 1) {
            [sv addConstraint:[NSLayoutConstraint constraintWithItem:lbv attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:subv attribute:NSLayoutAttributeTopMargin multiplier:1 constant:0]];
            [sv addConstraint:[NSLayoutConstraint constraintWithItem:lbv attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:subv attribute:NSLayoutAttributeLeadingMargin multiplier:1 constant:40]];
        } else {
            [supv addConstraint:[NSLayoutConstraint constraintWithItem:lbv attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:supv attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
            // margin won't display
//            [supv addConstraint:[NSLayoutConstraint constraintWithItem:lbv attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:supv attribute:NSLayoutAttributeTopMargin multiplier:1 constant:0]];
            [supv addConstraint:[NSLayoutConstraint constraintWithItem:lbv attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:supv attribute:NSLayoutAttributeLeadingMargin multiplier:1 constant:40]];
            
            [supv addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[sv]|" options:0 metrics: 0 views:dic]];
            [supv addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[sv]|" options:0 metrics: 0 views:dic]];
            
            lcs = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-40-[supv(>=100)]" options:0 metrics:nil views:dic];
            [self.view addConstraints:lcs];
            lcs = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-200-[supv(>=90)]" options:0 metrics:nil views:dic];
            [self.view addConstraints:lcs];
        }
        
//         [sv addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[image]|" options:0 metrics: 0 views:dic]];
//         [sv addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[image(<=100)]|" options:0 metrics: 0 views:dic]];
        
//        lcs = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-40-[sv(>=100)]" options:0 metrics:nil views:dic];
//        [self.view addConstraints:lcs];
//        lcs = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-200-[sv(>=90)]" options:0 metrics:nil views:dic];
//        [self.view addConstraints:lcs];
        
    }
}

- (void)tapLabel:(id)s {
    NSLog(@"tap lb");
}

- (void)tap:(id)s {
//    UIScrollView *sv = (UIScrollView*)[self.view viewWithTag:101];
//    NSLog(@"sv.contentoffset:%f",sv.contentOffset.y);
//    sv.contentInset = UIEdgeInsetsMake(0, 0, 00, 0);
//    NSLog(@"sv.contentoffset:%f",sv.contentOffset.y);
//    [sv scrollRectToVisible:CGRectMake(0, 0, 60, 40) animated:YES];
    
//    if ([self.view hasAmbiguousLayout]) {
//        [self.view exerciseAmbiguityInLayout];
//    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    NSLog(@"scrolling...");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
