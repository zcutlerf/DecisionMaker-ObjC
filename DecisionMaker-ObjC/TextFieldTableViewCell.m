//
//  TextFieldTableViewCell.m
//  DecisionMaker-ObjC
//
//  Created by Zoe Cutler on 3/16/23.
//

#import "TextFieldTableViewCell.h"

@implementation TextFieldTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [_textField setPlaceholder:@"New choice"];
    [_textField setFont: [UIFont preferredFontForTextStyle:UIFontTextStyleBody]];
    _textField.adjustsFontForContentSizeCategory = true;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
