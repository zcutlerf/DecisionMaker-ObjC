//
//  ViewController.m
//  DecisionMaker-ObjC
//
//  Created by Zoe Cutler on 3/13/23.
//

#import "ViewController.h"
#import "TextFieldTableViewCell.h"

@interface ViewController ()

@property NSMutableArray<NSString*>* choices;
@property UITableView* tableview;
@property UIButton* decideButton;
@property UIAlertController* alertController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Decision Maker";
    self.navigationController.navigationBar.prefersLargeTitles = true;

    _choices = [[NSMutableArray<NSString *> alloc] initWithCapacity:0];
    
    _tableview = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleInsetGrouped];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    _tableview.translatesAutoresizingMaskIntoConstraints = false;
    [_tableview registerNib: [UINib nibWithNibName:@"TextFieldTableViewCell" bundle:nil] forCellReuseIdentifier:@"textFieldCell"];
    
    [self.view addSubview:_tableview];
    
    _decideButton = [[UIButton alloc] init];
    [_decideButton setTitle:@"Decide!" forState:UIControlStateNormal];
    [_decideButton setTitleColor:[UIColor systemBlueColor] forState:UIControlStateNormal];
    [_decideButton setTitleColor:[UIColor systemGray5Color] forState:UIControlStateHighlighted];
    _decideButton.translatesAutoresizingMaskIntoConstraints = false;
    [_decideButton addTarget:self action:@selector(decide:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_decideButton];

    [_tableview.topAnchor constraintEqualToAnchor: (self.view).topAnchor].active = true;
    [_tableview.leadingAnchor constraintEqualToAnchor: (self.view).leadingAnchor].active = true;
    [_tableview.bottomAnchor constraintEqualToAnchor: _decideButton.topAnchor constant:-20.0].active = true;
    [_tableview.trailingAnchor constraintEqualToAnchor: (self.view).trailingAnchor].active = true;
    
    [_decideButton.bottomAnchor constraintEqualToAnchor: (self.view).layoutMarginsGuide.bottomAnchor].active = true;
    [_decideButton.centerXAnchor constraintEqualToAnchor: (self.view).centerXAnchor].active = true;
    
    _alertController = [UIAlertController alertControllerWithTitle:@"" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* okButton = [UIAlertAction actionWithTitle:@"Let's do it!" style:UIAlertActionStyleCancel handler:^(UIAlertAction * action) {
        [self->_choices removeAllObjects];
        [self->_tableview reloadData];
    }];
    [_alertController addAction:okButton];
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if(indexPath.row == _choices.count) {
        UITableViewCell *textFieldCell = [tableView dequeueReusableCellWithIdentifier:@"textFieldCell"];
        
        TextFieldTableViewCell *castedCell = (TextFieldTableViewCell*) textFieldCell;
        castedCell.delegate = self;
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

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row < _choices.count) {
        return YES;
    } else {
        return NO;
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //remove the deleted object from your data source.
        //If your data source is an NSMutableArray, do this
        [_choices removeObjectAtIndex:indexPath.row];
        [tableView reloadData]; // tell table to refresh now
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [_choices addObject:textField.text];
    
    textField.text = @"";
    
    [_tableview reloadData];
    return true;
}

- (void) decide:(UIButton *) sender {
    if(_choices.count < 2) {
        _alertController.title = @"Error";
        _alertController.message = @"Please enter at least 2 choices!";
        
        [self presentViewController:_alertController animated:YES completion:nil];
    } else {
        uint32_t randomIndex = arc4random_uniform([_choices count]);
        
        NSString *randomChoice = [_choices objectAtIndex:randomIndex];
        
        _alertController.title = randomChoice;
        _alertController.message = @"Hey, you gotta do it now. I don't make the rules.";
        
        [self presentViewController:_alertController animated:YES completion:nil];
    }
}

- (void)addItem:(nonnull TextFieldTableViewCell *)sender {
    [_choices addObject:sender.textField.text];
    
    sender.textField.text = @"";
    
    [_tableview reloadData];
}

@end
