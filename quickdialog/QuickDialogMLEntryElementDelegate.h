#import <Foundation/Foundation.h>

@class QMLEntryElement;
@class QMLEntryTableViewCell;
@class QDecimalTableViewCell;

@protocol QuickDialogMLEntryElementDelegate <NSObject>

@optional
- (BOOL)QEntryShouldChangeCharactersInRange:(NSRange)range withString:(NSString *)string forElement:(QMLEntryElement *)element andCell:(QMLEntryTableViewCell *)cell;
- (void)QEntryEditingChangedForElement:(QMLEntryElement *)element  andCell:(QMLEntryTableViewCell *)cell;
- (void)QEntryDidBeginEditingElement:(QMLEntryElement *)element  andCell:(QMLEntryTableViewCell *)cell;
- (void)QEntryDidEndEditingElement:(QMLEntryElement *)element andCell:(QMLEntryTableViewCell *)cell;
- (BOOL)QEntryShouldReturnForElement:(QMLEntryElement *)element andCell:(QMLEntryTableViewCell *)cell;
- (void)QEntryMustReturnForElement:(QMLEntryElement *)element andCell:(QMLEntryTableViewCell *)cell;

@end
