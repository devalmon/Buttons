//
//  ViewController.m
//  Buttons
//
//  Created by Alexey Baryshnikov on 07.06.2020.
//  Copyright © 2020 Alexey Baryshnikov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong)NSString *textLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blackColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor systemPinkColor];
//    [button setTitleColor:[UIColor systemPinkColor] forState:UIControlStateNormal];
//    button.layer.borderColor = [UIColor greenColor].CGColor;
//    [button setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
//    button.layer.borderWidth = 3;
//    [button setTitle:@"button" forState:UIControlStateNormal];
    button.frame = CGRectMake(100, 100, 100, 100);
    button.layer.cornerRadius = 12.f;
    
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:30], NSFontAttributeName, [UIColor orangeColor], NSForegroundColorAttributeName, nil];
    NSAttributedString *title = [[NSAttributedString alloc] initWithString:@"1" attributes:attributes];
    [button setAttributedTitle:title forState:UIControlStateNormal];


    button.tag = 1;
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.backgroundColor = [UIColor systemPinkColor];
    button2.frame = CGRectMake(250, 100, 100, 100);
    button2.tag = 2;
    button2.layer.cornerRadius = 12;
    
    NSDictionary *attributes2 = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:30], NSFontAttributeName, [UIColor orangeColor], NSForegroundColorAttributeName, nil];
    NSAttributedString *title2 = [[NSAttributedString alloc] initWithString:@"2" attributes:attributes2];
    [button2 setAttributedTitle:title2 forState:UIControlStateNormal];
    
    [self.view addSubview:button];
    [self.view addSubview:button2];
    
    [button addTarget:self action:@selector(printText:) forControlEvents:UIControlEventTouchUpInside];
    [button addTarget:self action:@selector(printText2:) forControlEvents:UIControlEventTouchUpOutside];
    

    
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"viewWillAppear");
    UILabel *tagLabel = [[UILabel alloc] initWithFrame:CGRectMake(200, 300, 100, 100)];
    tagLabel.backgroundColor = [UIColor whiteColor];
    tagLabel.layer.cornerRadius = 12;
    self.textLabel = @"label";
    tagLabel.text = self.textLabel;
    [self.view addSubview:tagLabel];
}

#pragma mark ***Actions***

- (void)printText:(UIButton *)button {
//    NSLog(@"%@", [button.titleLabel text]);
    NSLog(@"tag is %ld",button.tag);
    dispatch_async(dispatch_get_main_queue(), ^(void){
        self.textLabel = [NSString stringWithFormat:@"%ld", button.tag];
    });
    
}
- (void)printText2:(UIButton *)button {
    NSLog(@"outside");
}

@end
