//
//  ViewController.m
//  SHPickerFieldExample
//
//  Created by Regor on 21/11/16.
//  Copyright © 2016 Regor. All rights reserved.
//

//
//  ViewController.m
//  SHPickerFieldExample
//
//  Created by Regor on 21/11/16.
//  Copyright © 2016 Regor. All rights reserved.
//

#import "ViewController.h"
#import "SHPickerField.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet SHPickerField *textFieldDate;
@property (weak, nonatomic) IBOutlet SHPickerField *textFieldDateNTime;
@property (weak, nonatomic) IBOutlet SHPickerField *textFieldTime;
@property (weak, nonatomic) IBOutlet SHPickerField *textFieldCustomArray;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setUpPickerFields];
}


- (void)setUpPickerFields {
    
    // Set Up the picker type (Required)
    _textFieldDate.pickerType = SHPickerTypeDate;
    
    _textFieldDate.dateFormat = @"dd/MM/yyyy"; // set the format you want to see in your textfield; (Required)
    
    _textFieldDate.minimumDate = [NSDate dateWithTimeIntervalSince1970:0]; // set the minimum date (optional)
    
    _textFieldDate.maximumDate = [NSDate date]; // set the maximum date (optional)
    
    // The block recieves the texfield data and action ID
    [_textFieldDate actionCompletedInPicker:^(NSString * _Nonnull textFieldText, int actionID) {
        //TODO: when ever a delegate is fired, like didBeginEditing or didEndEditing
        
    }];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
