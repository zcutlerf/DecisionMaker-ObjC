//
//  ViewController.m
//  DecisionMaker-ObjC
//
//  Created by Zoe Cutler on 3/13/23.
//

#import "ViewController.h"

@interface ViewController ()

@property NSArray<NSString*>* mentors;
@property UITextField* textField;

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
    
    _textField = [[UITextField alloc] init];
    _textField.delegate = self;
    _textField.translatesAutoresizingMaskIntoConstraints = false;
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    if(indexPath.row == _mentors.count) {
        [cell addSubview:_textField];
//        [_textField.topAnchor constraintEqualToAnchor: cell.topAnchor].active = true;
//        [_textField.leadingAnchor constraintEqualToAnchor: cell.leadingAnchor].active = true;
//        [_textField.bottomAnchor constraintEqualToAnchor: cell.bottomAnchor].active = true;
//        [_textField.trailingAnchor constraintEqualToAnchor: cell.trailingAnchor].active = true;
        _textField.backgroundColor = [UIColor blueColor];
        return cell;
    } else {
        cell.textLabel.text = _mentors[indexPath.row];
        return cell;
    }
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _mentors.count + 1;
}

@end
