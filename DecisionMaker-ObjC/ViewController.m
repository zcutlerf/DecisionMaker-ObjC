//
//  ViewController.m
//  DecisionMaker-ObjC
//
//  Created by Zoe Cutler on 3/13/23.
//

#import "ViewController.h"
#import "TextFieldTableViewCell.h"

@interface ViewController ()

@property NSArray<NSString*>* choices;
@property UITableView* tableview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _choices = @[@"Tacos", @"Pizza", @"Burger"];
    
    _tableview = [[UITableView alloc] init];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    _tableview.translatesAutoresizingMaskIntoConstraints = false;
    
    [self.view addSubview:_tableview];

    [_tableview.topAnchor constraintEqualToAnchor: (self.view).topAnchor].active = true;
    [_tableview.leadingAnchor constraintEqualToAnchor: (self.view).leadingAnchor].active = true;
    [_tableview.bottomAnchor constraintEqualToAnchor: (self.view).bottomAnchor].active = true;
    [_tableview.trailingAnchor constraintEqualToAnchor: (self.view).trailingAnchor].active = true;
    
    [_tableview registerNib: [UINib nibWithNibName:@"TextFieldTableViewCell" bundle:nil] forCellReuseIdentifier:@"textFieldCell"];
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if(indexPath.row == _choices.count) {
        UITableViewCell *textFieldCell = [tableView dequeueReusableCellWithIdentifier:@"textFieldCell"];
        
        TextFieldTableViewCell *castedCell = (TextFieldTableViewCell*) textFieldCell;
        castedCell.textField.delegate = self;
        
        return castedCell;
    } else {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
        
        cell.textLabel.text = _choices[indexPath.row];
        return cell;
    }
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _choices.count + 1;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
//    [_choices addObject:textField.text];
    _choices = [_choices arrayByAddingObject:textField.text];
    
    textField.text = @"";
    
    [_tableview reloadData];
    return true;
}

@end
