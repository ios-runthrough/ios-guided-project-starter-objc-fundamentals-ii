//
//  LSITipViewController.m
//  Tips
//
//  Created by Spencer Curtis on 2/6/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "LSITipViewController.h"
#import "../Model Controllers/LSITipController.h"
#import "../Models/LSITip.h"

@interface LSITipViewController () <UITableViewDataSource, UITableViewDelegate>

// Private Properties
@property (nonatomic) double total;
@property (nonatomic) int split;
@property (nonatomic) double percentage;
@property (nonatomic) double tip;
@property (nonatomic) LSITipController *tipController;

// Private IBOutlets
@property (nonatomic) IBOutlet UITextField *totalTextField;
@property (nonatomic) IBOutlet UILabel *splitLabel;
@property (nonatomic) IBOutlet UILabel *tipLabel;
@property (nonatomic) IBOutlet UILabel *percentageLabel;
@property (nonatomic) IBOutlet UIStepper *splitStepper;
@property (nonatomic) IBOutlet UISlider *percentageSlider;
@property (nonatomic) IBOutlet UITableView *tableView;

// Private Methods
- (void)calculateTip;
- (void)updateViews;
- (void)saveTipNamed:(NSString *)name;
@end

@implementation LSITipViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tipController = [[LSITipController alloc] init];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self calculateTip];
}

- (void)calculateTip
{
    self.percentage = round(self.percentageSlider.value);
    self.total = self.totalTextField.text.doubleValue;
    self.split = self.splitStepper.value;
    self.tip = self.total * (self.percentage / 100.) / self.split;
    [self updateViews];
}
- (void)updateViews
{
    self.splitStepper.value = self.split;
    self.percentageSlider.value = self.percentage;
    self.totalTextField.text = [NSString stringWithFormat:@"%.2f", self.total];
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", self.tip];
    self.splitLabel.text = [NSString stringWithFormat:@"%ld", (long)self.split];
    // %% = % for output
    self.percentageLabel.text = [NSString stringWithFormat:@"%0.0f%%", self.percentage];
}
- (void)saveTipNamed:(NSString *)name
{
    [self.tipController addTip:[[LSITip alloc] initWithname:name
                                                      total:self.total
                                                 splitCount:self.split
                                              tipPercentage:self.percentage]];
    [self.tableView reloadData];
}

// MARK: - IBActions
- (IBAction)updateSplit:(id)sender
{
    self.split = round(self.splitStepper.value);
//    self.split = round([sender value]);
}

- (IBAction)updatePercentage:(id)sender
{
    self.percentage = round(self.percentageSlider.value);
}

- (IBAction)saveTip:(id)sender
{
    [self showSaveTipAlert];
}
// TODO: Connect actions for splitChanged, sliderChanged, and Save Tip button


// MARK: - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tipController.tipCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TipCell" forIndexPath:indexPath];
    LSITip *tip = [self.tipController tipAtIndex:indexPath.row];
    cell.textLabel.text = tip.name;
    return cell;
}

// MARK: - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LSITip *tip = [self.tipController tipAtIndex:indexPath.row];
    self.total = tip.total;
    self.split = tip.splitCount;
    self.percentage = tip.tipPercentage;
    [self updateViews];
    [self calculateTip];
}

// TODO: Load the selected tip from the controller

//}

// MARK: - Alert Helper

- (void)showSaveTipAlert {
    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle:@"Save Tip"
                                message:@"What name would you like to give to this tip?"
                                preferredStyle:UIAlertControllerStyleAlert];
    
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Tip Name:";
    }];
    
    UIAlertAction *saveAction = [UIAlertAction actionWithTitle:@"Save"
                                                         style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        NSString *name = [[alert.textFields firstObject] text];
        if (name.length > 0) {
            [self saveTipNamed: name];
        }
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
    
    [alert addAction:saveAction];
    [alert addAction:cancelAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

@end
