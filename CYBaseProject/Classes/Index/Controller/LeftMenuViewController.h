//
//  LeftMenuViewController.h
//  100Days
//
//  Created by Peter Lee on 16/8/30.
//  Copyright © 2016年 CY.Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,LeftSideActionType) {
    LeftSideActionTypeController,
    LeftSideActionTypeControllerFromStoryboard,
    LeftSideActionTypeSwitchLanguage
};

@interface LeftSideViewOption : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *className;
@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, copy) NSString *detail;
@property (nonatomic, assign) LeftSideActionType leftSideActionType;

- (instancetype)initWithWithTitle:(NSString *)title imageName:(NSString *)imageName actionType:(LeftSideActionType)leftSideActionType;
+ (instancetype)optionWithTitle:(NSString *)title imageName:(NSString *)imageName actionType:(LeftSideActionType)leftSideActionType;

@end

typedef void(^LeftSideOptionBlock)(LeftSideViewOption *option);
typedef void(^ModifyButtonActionBlock)();
typedef void(^HeaderButtonActionBlock)();

@interface LeftMenuViewController : UIViewController

@property (nonatomic, copy) LeftSideOptionBlock leftSideOptionBlock;
@property (nonatomic, copy) ModifyButtonActionBlock modifyButtonActionBlock;
@property (nonatomic, copy) HeaderButtonActionBlock headerButtonActionBlock;

@end

