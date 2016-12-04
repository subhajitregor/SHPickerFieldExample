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
    UIBarButtonItem *barButtonDone;
    UIBarButtonItem *barButtonCancel;
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

- (void)setPickerBackgroundColor:(UIColor *)pickerBackgroundColor {
    _pickerBackgroundColor = pickerBackgroundColor;
    if (self.pickerType == SHPickerTypeDefault) {
        pickerView.backgroundColor = pickerBackgroundColor;
    }
    else {
        datePicker.backgroundColor = pickerBackgroundColor;
    }
}

- (void)setPickerTintColor:(UIColor *)pickerTintColor {
    _pickerTintColor = pickerTintColor;
    if (self.pickerType == SHPickerTypeDefault) {
//        [pickerView setTintColor:pickerTintColor];
        [pickerView setValue:pickerTintColor forKey:@"textColor"];
    }
    else {
        [datePicker setValue:pickerTintColor forKey:@"textColor"];
    }
}

-(void)setPickerToolBarColor:(UIColor *)pickerToolBarColor {
    _pickerToolBarColor = pickerToolBarColor;
    [toolBar setBarTintColor:pickerToolBarColor];
}

- (void)setPickerToolBarItemColor:(UIColor *)pickerToolBarItemColor {
    _pickerToolBarItemColor = pickerToolBarItemColor;
    
    [barButtonDone setTintColor:pickerToolBarItemColor];
    [barButtonCancel setTintColor:pickerToolBarItemColor];
}

- (void)setPickerToolBarTranslucent:(BOOL)pickerToolBarTranslucent {
    _pickerToolBarTranslucent = pickerToolBarTranslucent;
    [toolBar setTranslucent:pickerToolBarTranslucent];
}

- (void)setPickerType:(SHPickerType)pickerType {
    _pickerType = pickerType ? pickerType : SHPickerTypeDefault;
    
    //----------
    toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 44)];
    toolBar.barStyle = UIBarStyleDefault;
    [toolBar sizeToFit];
    NSMutableArray *barItems = [[NSMutableArray alloc] init];
    barButtonCancel = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelPressed:)];
    [barItems addObject:barButtonCancel];
    UIBarButtonItem *barItemFlexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    [barItems addObject:barItemFlexible];
    barButtonDone = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(donePressed:)];
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
        case SHPickerTypeTime:
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
//            [datePicker addTarget:self action:@selector(dateOrTimeSelected:) forControlEvents:UIControlEventValueChanged];
            
            [self setInputView:datePicker];
            [self setInputAccessoryView:toolBar];
            
            break;
        }
        //---------
        default:
            break;
    }
    
    [self setDefaults];
}

#pragma mark - UI

- (void)setDefaults {
    
    self.pickerToolBarItemColor = self.pickerToolBarItemColor ? self.pickerToolBarItemColor : [UIColor whiteColor];
    self.pickerToolBarColor = self.pickerToolBarColor ? self.pickerToolBarColor : [UIColor darkGrayColor];
}


#pragma mark - Actions

- (void)dateOrTimeSelected:(UIDatePicker *)currentdatePicker {
    NSDate *selectedDate = [currentdatePicker date];
    self.text = [dateFormatter stringFromDate:selectedDate];
//    completionHandler(self.text, SHPickerActionDateTimeSelected);
//    [self layoutIfNeeded];
}

- (void)cancelPressed:(id)sender {
    [self resignFirstResponder];
    completionHandler(self.text, SHPickerActionPickerCancel);
}

- (void)donePressed:(id)sender {
    
    
    
    if (self.pickerType == SHPickerTypeDefault) {
        
        self.text = [self.dataSource objectAtIndex:[pickerView selectedRowInComponent:0]];
    }
    
    if (self.pickerType == SHPickerTypeTime || self.pickerType == SHPickerTypeDate || self.pickerType == SHPickerTypeDateAndTime) {
      
        [self dateOrTimeSelected:datePicker];
    }

    [self resignFirstResponder];

    completionHandler(self.text, SHPickerActionPickerDone);
    
    //self.text =  selectedText;
    //completionHandler(self.text, 0);
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
    
//    if (_dataSource.count > 0) {
//        self.text = [NSString stringWithFormat:@"%@", _dataSource[row]];
//    }
//    completionHandler(self.text, SHPickerActionPickerDidSelectRow);
}

- (void)actionCompletedInPicker:(_Nonnull SHTextFieldActionCompletion)handler {
    completionHandler = handler;
    self.delegate = self;
}


#pragma mark - TextField Delegate

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    completionHandler (self.text, SHPickerActionDidBeginEditing);
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    completionHandler (self.text, SHPickerActionDidEndEditing);
}

@end
