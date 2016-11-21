//
//  SHPickerField.h
//  Odyssey
//
//  Created by subhajit halder on 17/09/16.
//  Copyright © 2016 SubhajitHalder. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, SHPickerType) {
    SHPickerTypeDefault,
    SHPickerTypeDate,
    SHPickerTypeDateAndTime,
    SHPickerTypeTime
};


typedef void (^SHTextFieldActionCompletion) (NSString  * _Nonnull textFieldText, int  actionID);

@interface SHPickerField : UITextField {
    SHTextFieldActionCompletion completionHandler;
}

/*!
 * @brief Always Required as it will switch the picker type.
 */@property (nonatomic) SHPickerType pickerType;

/*!
 * @brief To set NSDateFormatter with format. Provide only date format string e.g.: dateField.dateFormat = \@"MM - dd - yyyy".
 */@property (nonatomic, nonnull) NSString * dateFormat;

/*!
 * @brief Used only for Default Picker. Use this for custom data in Picker.
 */@property (nonatomic, nullable) NSArray *dataSource;

/*!
 * @brief ToolBar Color, (Deafault / Dark).
 */@property (nonatomic) UIBarStyle toolbarStyle;

/*!
 * @brief Set maximum date or minimum date for date picker (Cannot be used in Default Picker).
 */@property (nonatomic, nullable) NSDate *minimumDate, *maximumDate;

/*!
 * @brief Picker Color
 */@property (nonatomic, nullable) UIColor *pickerBackgroundColor;

/*!
 * @discussion Returns Data whenever a ction performed
 * @param handler Returns textField Data and action ID
 */
- (void)actionCompletedInPicker:(_Nonnull SHTextFieldActionCompletion)handler;
@end
