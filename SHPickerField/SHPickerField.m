//
//  SHPickerField.m
//  Odyssey
//
//  Created by subhajit halder on 17/09/16.
//  Copyright © 2016 SubhajitHalder. All rights reserved.
//

#import "SHPickerField.h"

@interface SHPickerField()<UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate>

@end

@implementation SHPickerField {
    UIToolbar *toolBar;
    UIPickerView *pickerView;
    UIDatePicker *datePicker;
    NSDateFormatter *dateFormatter;
    NSString *selectedText;
}

- (void)setToolbarStyle:(UIBarStyle)toolbarStyle {
    _toolbarStyle = toolbarStyle;
    toolBar.barStyle = _toolbarStyle;
}

- (void)setDateFormat:(NSString *)dateFormat {
    _dateFormat = dateFormat;
    
    dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:dateFormat];
    
}

- (void)setMinimumDate:(NSDate *)minimumDate {
    _minimumDate = minimumDate;
    datePicker.minimumDate = _minimumDate;
}

- (void)setMaximumDate:(NSDate *)maximumDate {
    _maximumDate = maximumDate;
    datePicker.maximumDate = _maximumDate;
}

- (void)setDataSource:(NSArray *)dataSource {
    _dataSource = dataSource;
    [pickerView reloadAllComponents];
}

- (void)setPickerType:(SHPickerType)pickerType {
    _pickerType = pickerType ? pickerType : SHPickerTypeDefault;
    
    //----------
    toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 44)];
    toolBar.barStyle = UIBarStyleDefault;
    [toolBar sizeToFit];
    NSMutableArray *barItems = [[NSMutableArray alloc] init];
    UIBarButtonItem *barItemFlexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    [barItems addObject:barItemFlexible];
    UIBarButtonItem *barButtonDone = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(donePressed:)];
    [barItems addObject:barButtonDone];
    [toolBar setItems:barItems];
    

    switch (pickerType) {
        case SHPickerTypeDefault:
            //
        {
            pickerView = [[UIPickerView alloc] initWithFrame:CGRectZero];
            pickerView.delegate = self;
            pickerView.dataSource = self;
            self.delegate = self;
            [pickerView setShowsSelectionIndicator:YES];
            
            [self setInputView:pickerView];
            [self setInputAccessoryView:toolBar];
            
            break;
        }
        //---------
        case SHPickerTypeDate:
        case SHPickerTypeDateAndTime:
        {
            //
            datePicker = [[UIDatePicker alloc]initWithFrame:CGRectZero];
            datePicker.datePickerMode = UIDatePickerModeDate;
            if (pickerType == SHPickerTypeDateAndTime) {
                datePicker.datePickerMode = UIDatePickerModeDateAndTime;
            }
            else if (pickerType == SHPickerTypeTime) {
                datePicker.datePickerMode = UIDatePickerModeTime;
            }
            [datePicker addTarget:self action:@selector(dateOrTimeSelected:) forControlEvents:UIControlEventValueChanged];
            
            [self setInputView:datePicker];
            [self setInputAccessoryView:toolBar];
            
            break;
        }
        //---------
        default:
            break;
    }
}

- (void)dateOrTimeSelected:(UIDatePicker *)currentdatePicker {
    NSDate *selectedDate = [currentdatePicker date];
    self.text = [dateFormatter stringFromDate:selectedDate];
    completionHandler(self.text, 2);
//    [self layoutIfNeeded];
}

- (void)donePressed:(id)sender {
    [self resignFirstResponder];
    //self.text =  selectedText;
    completionHandler(self.text, 0);
}


#pragma mark - picker delegate 

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
     return _dataSource.count;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return _dataSource[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    if (_dataSource.count > 0) {
        self.text = [NSString stringWithFormat:@"%@", _dataSource[row]];
    }
    completionHandler(self.text, 1);
}

- (void)actionCompletedInPicker:(_Nonnull SHTextFieldActionCompletion)handler {
    completionHandler = handler;
}


#pragma mark - TextField Delegate

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    if (textField == self && self.pickerType == SHPickerTypeDefault) {
        if (_dataSource.count > 0) {
            self.text = [NSString stringWithFormat:@"%@",_dataSource[[pickerView selectedRowInComponent:0]]];
        }
        
        
    }
    completionHandler (self.text, 10);
}

@end
