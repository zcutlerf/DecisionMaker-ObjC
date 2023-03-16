//
//  ViewController.m
//  DecisionMaker-ObjC
//
//  Created by Zoe Cutler on 3/13/23.
//

#import "ViewController.h"
#import "TextFieldTableViewCell.h"

@interface ViewController ()

@property NSArray<NSString*>* mentors;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _mentors = @[@"Zoe", @"Tom", @"Tariq", @"Ty", @"Cory"];
    
    UITableView *tableView = [[UITableView alloc] init];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.translatesAutoresizingMaskIntoConstraints = false;
    
    [self.view addSubview:tableView];

    [tableView.topAnchor constraintEqualToAnchor: (self.view).topAnchor].active = true;
    [tableView.leadingAnchor constraintEqualToAnchor: (self.view).leadingAnchor].active = true;
    [tableView.bottomAnchor constraintEqualToAnchor: (self.view).bottomAnchor].active = true;
    [tableView.trailingAnchor constraintEqualToAnchor: (self.view).trailingAnchor].active = true;
    
    [tableView registerNib: [UINib nibWithNibName:@"TextFieldTableViewCell" bundle:nil] forCellReuseIdentifier:@"textFieldCell"];
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if(indexPath.row == _mentors.count) {
        UITableViewCell *textFieldCell = [tableView dequeueReusableCellWithIdentifier:@"textFieldCell"];
        
        TextFieldTableViewCell *castedCell = (TextFieldTableViewCell*) textFieldCell;
        castedCell.textField.delegate = self;
        
        return castedCell;
    } else {
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
        
        cell.textLabel.text = _mentors[indexPath.row];
        return cell;
    }
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _mentors.count + 1;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return true;
}

@end
