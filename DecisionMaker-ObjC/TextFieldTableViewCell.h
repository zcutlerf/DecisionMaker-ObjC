//
//  TextFieldTableViewCell.h
//  DecisionMaker-ObjC
//
//  Created by Zoe Cutler on 3/16/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class TextFieldTableViewCell;
@protocol AddButtonDelegate <NSObject>

- (void) addItem: (TextFieldTableViewCell *) sender;

@end

@interface TextFieldTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (nonatomic, nullable) id <AddButtonDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
