//
//  TemperatureViewController.m
//  Temperatore Converter
//
//  Created by Z_ZyngaTesting on 10/4/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "TemperatureViewController.h"

@interface TemperatureViewController ()

@property (weak, nonatomic) IBOutlet UITextField *inputText;
@property (weak, nonatomic) IBOutlet UISegmentedControl *unitControl;
@property (weak, nonatomic) IBOutlet UILabel *outputText;
@property (weak, nonatomic) IBOutlet UILabel *outputUnit;

- (IBAction)onTap:(id)sender;
- (void)updateValues;
- (IBAction)outputUnitChanged:(id)sender;

@end

@implementation TemperatureViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Temperature Converter";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self updateValues];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (void)updateValues {
    float inputValue = [self.inputText.text floatValue];
    float outputValue;
    if(self.unitControl.selectedSegmentIndex == 0) {
        outputValue = (inputValue - 32) / 1.8;
        self.outputUnit.text = @"Celcius";
    } else {
        outputValue = inputValue * 1.8 + 32;
        self.outputUnit.text = @"Fehrenheit";
    }
    self.outputText.text = [NSString stringWithFormat:@"%0.2f", outputValue];
}

- (IBAction)outputUnitChanged:(id)sender {
    [self updateValues];
}


@end
