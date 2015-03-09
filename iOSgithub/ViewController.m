//
//  ViewController.m
//  iOSgithub
//
//  Created by cindy on 2015/3/8.
//  Copyright (c) 2015年 cindy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    float digit ;
    NSString *numberString;
    
    NSString *function;
    int firstNum;
    int secondNum;
    
}
@property (weak, nonatomic) IBOutlet UILabel *result;


@end

// test
@implementation ViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    
}


- (IBAction)buttonPress:(UIButton *)sender {
    
    if (!numberString) {
        numberString = [NSString stringWithFormat:@"%ld", [sender tag]];
    } else {
        numberString = [NSString stringWithFormat:@"%@%ld", numberString, [sender tag]];
    }
    
    _result.text = [NSString stringWithFormat:@"%@", numberString];
    
}
- (IBAction)functionBtn:(UIButton *)sender {
    
    //function = [sender currentTitle];
    
    if(function == nil){
        //set the first number integer value from the string
        firstNum = [numberString intValue];
        NSLog(@"%d", firstNum);
        
        //reset number string
        numberString = nil;
        
        //update
        _result.text = [NSString stringWithFormat:@"%d", firstNum];
        
        [self functionDetection:[sender currentTitle]];
        
    } else {
        
        secondNum = [numberString intValue];
        _result.text = [NSString stringWithFormat:@"0"];
        
        NSLog(@"%d", secondNum);
        numberString = nil;
        if ([function isEqualToString:@"+"]) {
            firstNum = firstNum + secondNum ;
        }
        if ([function isEqualToString:@"-"]) {
            firstNum = firstNum - secondNum ;
        }
        if ([function isEqualToString:@"*"]) {
            firstNum = firstNum * secondNum ;
        }
        if ([function isEqualToString:@"/"]) {
            firstNum = firstNum / secondNum ;
        }
        
        //update
        _result.text = [NSString stringWithFormat:@"%d", firstNum];
        
        [self functionDetection:[sender currentTitle]];

    }
    
}

- (void)functionDetection:(NSString *)sender{
    
    function = sender;
    NSLog(@"%@", function);
    
}

- (IBAction)calculateResult:(id)sender{
    
    
    secondNum = [numberString intValue];
    NSLog(@"%d ", secondNum);
    
    if([function isEqualToString:@"+"]){
        firstNum = firstNum + secondNum ;
    }
    if([function isEqualToString:@"-"]){
        firstNum = firstNum - secondNum ;
    }
    if([function isEqualToString:@"*"]){
        firstNum = firstNum * secondNum ;
    }
    if([function isEqualToString:@"/"]){
        firstNum = firstNum / secondNum ;
    }
    
    _result.text = [NSString stringWithFormat:@"%d", firstNum];
    
    numberString = _result.text;
    secondNum = 0;
    function = 0;
    
    
}

- (IBAction)remove:(UIButton *)sender {
    _result.text = [NSString stringWithFormat:@"0"];
    
    numberString = nil;
    firstNum = 0;
    secondNum = 0;
    function = 0;
}


@end
