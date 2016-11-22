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
    
    [self setUpPickerFieldDate];
    [self setUpPickerFieldDateNTime];
    [self setUpPickerFieldTime];
    [self setUpPickerFieldCustom];
}


- (void)setUpPickerFieldDate {
    
    // Set Up the picker type (Required)
    _textFieldDate.pickerType = SHPickerTypeDate;
    
    _textFieldDate.dateFormat = @"dd/MM/yyyy"; // set the format you want to see in your textfield; (Required)
    
    _textFieldDate.minimumDate = [NSDate dateWithTimeIntervalSince1970:0]; // set the minimum date (optional)
    
    _textFieldDate.maximumDate = [NSDate date]; // set the maximum date (optional)
    
    _textFieldDate.pickerToolBarColor = [UIColor blueColor];
    _textFieldDate.pickerToolBarItemColor = [UIColor whiteColor];
    _textFieldDate.pickerToolBarTranslucent = NO;
    _textFieldDate.pickerBackgroundColor = [UIColor purpleColor];
    _textFieldDate.pickerTintColor = [UIColor whiteColor];
    
    // The block recieves the texfield data and action ID
    [_textFieldDate actionCompletedInPicker:^(NSString * _Nonnull textFieldText, SHPickerAction actionID) {
        //TODO: when ever a delegate is fired, like didBeginEditing or didEndEditing
        
        if (actionID == SHPickerActionDidBeginEditing) {
            
        }
        
        if (actionID == SHPickerActionDidEndEditing) {
            
        }
        
        
    }];
    
    
    
}

- (void)setUpPickerFieldDateNTime {
    
    // Set Up the picker type (Required) ### very very important as it changes pickers data mode
    _textFieldDateNTime.pickerType = SHPickerTypeDateAndTime;
    
    _textFieldDateNTime.dateFormat = @"dd/MM/yyyy HH:mm"; // set the format you want to see in your textfield; (Required)
    
    _textFieldDateNTime.minimumDate = [NSDate dateWithTimeIntervalSince1970:0]; // set the minimum date (optional)
    
    _textFieldDateNTime.maximumDate = [NSDate date]; // set the maximum date (optional)
    
    // The block recieves the texfield data and action ID
    [_textFieldDateNTime actionCompletedInPicker:^(NSString * _Nonnull textFieldText, SHPickerAction actionID) {
        //TODO: when ever a delegate is fired, like didBeginEditing or didEndEditing
        if (actionID == SHPickerActionDidBeginEditing) {
            
        }
        
        if (actionID == SHPickerActionDidEndEditing) {
            
        }
    }];
    
    
    
}

- (void)setUpPickerFieldTime {
    
    // Set Up the picker type (Required) ### very very important as it changes pickers data mode
    _textFieldTime.pickerType = SHPickerTypeTime;
    
    _textFieldTime.dateFormat = @"hh:mm a"; // set the format you want to see in your textfield; (Required)
    
    
    // The block recieves the texfield data and action ID
    [_textFieldTime actionCompletedInPicker:^(NSString * _Nonnull textFieldText, SHPickerAction actionID) {
        //TODO: when ever a delegate is fired, like didBeginEditing or didEndEditing
        if (actionID == SHPickerActionDidBeginEditing) {
            
        }
        
        if (actionID == SHPickerActionDidEndEditing) {
            
        }
    }];
    
    
    
}

- (void)setUpPickerFieldCustom {
    
    // Set Up the picker type (Required) ### very very important as it changes pickers data mode
    _textFieldCustomArray.pickerType = SHPickerTypeDefault;
    
    _textFieldCustomArray.dataSource = @[ @"One", @"Two", @"Three", @"Four"];
    
    
    _textFieldCustomArray.pickerToolBarColor = [UIColor yellowColor];
    _textFieldCustomArray.pickerToolBarItemColor = [UIColor greenColor];
    _textFieldCustomArray.pickerToolBarTranslucent = YES;
    _textFieldCustomArray.pickerBackgroundColor = [UIColor redColor];
    _textFieldCustomArray.pickerTintColor = [UIColor yellowColor];
    
    // The block recieves the texfield data and action ID
    [_textFieldCustomArray actionCompletedInPicker:^(NSString * _Nonnull textFieldText, SHPickerAction actionID) {
        //TODO: when ever a delegate is fired, like didBeginEditing or didEndEditing
        if (actionID == SHPickerActionDidBeginEditing) {
            
        }
        
        if (actionID == SHPickerActionDidEndEditing) {
            
        }
    }];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
