//
//  TextFieldTableViewCell.m
//  DecisionMaker-ObjC
//
//  Created by Zoe Cutler on 3/16/23.
//

#import "TextFieldTableViewCell.h"

@implementation TextFieldTableViewCell
@synthesize delegate;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [_textField setPlaceholder:@"New choice"];
    [_textField setFont: [UIFont preferredFontForTextStyle:UIFontTextStyleBody]];
    _textField.adjustsFontForContentSizeCategory = true;
    [_textField becomeFirstResponder];
    
    [_addButton addTarget:self action:@selector(addItem:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) addItem:(UIButton *) sender {
    [self.delegate addItem:self];
}


@end
