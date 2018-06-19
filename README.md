# SHPickerFieldExample
A UITextField subclass, which on being active shows a UIPickerView instead of a Keyboard. Many time we want picker views
for fields like Date of birth, Gender, etc.

SHPickerField is one stop solution for multiple type of pickers for TextFields. Even when delegates are called it calls under
the completion block as actionIDs.

## Installation
1. Download the code 
2. Drag drop SHPickerField.h and .m file in your XCode project.
3. Check "Copy if needed" and press finish.

## Usage:
1. Go to storyboard and select the textfield in which you want to embed pickerview as first responder.
2. After selecting tap Identity Inspector in the Right Side Bar then in the class field under Custom Class write SHPickerField.
3. Now on the ViewController.m file:
```objective-c    
#import "ViewController.h"`
#import "SHPickerField.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet SHPickerField *textFieldDate;
@property (weak, nonatomic) IBOutlet SHPickerField *textFieldCustomArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setUpPickerFieldDate];
    [self setUpPickerFieldCustom];
}


- (void)setUpPickerFieldDate {
    
    // Set Up the picker type (Required)
    _textFieldDate.pickerType = SHPickerTypeDate;
    
    _textFieldDate.dateFormat = @"dd/MM/yyyy"; // set the format you want to see in your textfield; (Required)
    
    _textFieldDate.minimumDate = [NSDate dateWithTimeIntervalSince1970:0]; // set the minimum date (optional)
    
    _textFieldDate.maximumDate = [NSDate date]; // set the maximum date (optional)
    
    // Picker Appearence Customization
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

- (void)setUpPickerFieldCustom {
    
    // Set Up the picker type (Required) ### very very important as it changes pickers data mode
    _textFieldCustomArray.pickerType = SHPickerTypeDefault;
    
    _textFieldCustomArray.dataSource = @[ @"One", @"Two", @"Three", @"Four"];
    
    // Picker Appearence Customization
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

@end
```

### Type of pickers

```objective-c
    textField.pickerType = SHPickerTypeDefault;
    textField.pickerType = SHPickerTypeTime;
    textField.pickerType = SHPickerTypeDate;
    textField.pickerType = SHPickerTypeDateAndTime;
```

### Type of ActionIds recieved inside block

```objective-c
    SHPickerActionDidBeginEditing,
    SHPickerActionDidEndEditing,
    SHPickerActionDateTimeSelected,
    SHPickerActionPickerDidSelectRow,
    SHPickerActionPickerDone,
    SHPickerActionPickerCancel
```

## Important

Please see the example for details.
When not using default picker, setting the datasource property will have no effect.
And not setting the datasource when using default picker will result in an empty picker datasource.
Likely, date related properties will not effect when using default picker.
See [SHPickerField.h](SHPickeField/SHPickerField.h) for available properties.

## Deployment

The example is created on XCode 8 with Deployment Target iOS 9.0.

## Author

* **Subhajit Halder** - *Initial work* - [StackOverflow Profile](http://stackoverflow.com/users/5247034/subhajit-halder)

[GitHub Profile](https://github.com/subhajitregor) 

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

