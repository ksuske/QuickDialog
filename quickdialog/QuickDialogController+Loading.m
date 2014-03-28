//                                
// Copyright 2011 ESCOZ Inc  - http://escoz.com
// 
// Licensed under the Apache License, Version 2.0 (the "License"); you may not use this 
// file except in compliance with the License. You may obtain a copy of the License at 
// 
// http://www.apache.org/licenses/LICENSE-2.0 
// 
// Unless required by applicable law or agreed to in writing, software distributed under
// the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF 
// ANY KIND, either express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import <CoreGraphics/CoreGraphics.h>
#import "QuickDialogController.h"

@implementation QuickDialogController (Loading)

- (UIView *)createLoadingView {

    UIView *loading = [[UIView alloc] init];
    loading.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
    loading.autoresizingMask = UIViewAutoresizingFlexibleWidth  | UIViewAutoresizingFlexibleHeight;
    loading.tag = 1123002;
    UIActivityIndicatorView *activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [activity startAnimating];
    [activity sizeToFit];
    activity.center = CGPointMake(loading.center.x, loading.frame.size.height/3);
    activity.autoresizingMask = UIViewAutoresizingFlexibleWidth  | UIViewAutoresizingFlexibleHeight;

    [loading addSubview:activity];

    if (self.view.superview) {
        [self.view.superview addSubview:loading];
        [self.view.superview bringSubviewToFront:loading];
    } else {
        [self.view addSubview:loading];
        [self.view bringSubviewToFront:loading];
    }
    return loading;
}


- (void)loading:(BOOL)visible {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = visible;
    UIView *loadingView = nil;
    if (self.view.superview) {
        loadingView = [self.view.superview viewWithTag:1123002];
    } else {
        loadingView = [self.view viewWithTag:1123002];
    }
    if (loadingView==nil){
        loadingView = [self createLoadingView];
    }
    loadingView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    self.quickDialogTableView.userInteractionEnabled = !visible;

    if (visible) {
        loadingView.hidden = NO;
        [self.view bringSubviewToFront:loadingView];
    }

    loadingView.alpha = visible ? 0 : 1;
    [UIView animateWithDuration:0.3
                     animations:^{
                          loadingView.alpha = visible ? 1 : 0;
                     }
                     completion: ^(BOOL  finished) {
                         if (!visible) {
                              loadingView.hidden = YES;
                              [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
                         }
                     }];
}
@end
