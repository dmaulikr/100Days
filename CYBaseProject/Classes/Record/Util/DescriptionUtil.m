//
//  DescriptionUtil.m
//  100Days
//
//  Created by Peter Lee on 16/9/4.
//  Copyright © 2016年 CY.Lee. All rights reserved.
//

#import "DescriptionUtil.h"

@implementation DescriptionUtil

+ (NSString *)monthDescriptionOfDate:(NSDate *)date{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"MM";
    NSUInteger month = [[formatter stringFromDate:date]integerValue];
    switch (month) {
        case 1:
            return NSLocalizedString(@"Jan", nil);
        case 2:
            return NSLocalizedString(@"Feb", nil);
        case 3:
            return NSLocalizedString(@"Mar", nil);
        case 4:
            return NSLocalizedString(@"Apr", nil);
        case 5:
            return NSLocalizedString(@"Mar", nil);
        case 6:
            return NSLocalizedString(@"Jun", nil);
        case 7:
            return NSLocalizedString(@"Jul", nil);
        case 8:
            return NSLocalizedString(@"Aug", nil);
        case 9:
            return NSLocalizedString(@"Sep", nil);
        case 10:
            return NSLocalizedString(@"Oct", nil);
        case 11:
            return NSLocalizedString(@"Nov", nil);
        case 12:
            return NSLocalizedString(@"Dec", nil);
        default:
            return @"";
    }
}

+ (NSString *)ordinalNumberSuffixWithNumber:(NSInteger)num{
    NSString *suffix;
    if (num%10==1&&num!=11) {
        suffix = @"st";
    }else if (num%10==2&&num!=12) {
        suffix = @"nd";
    }else{
        suffix = @"th";
    }
    return suffix;
}

+ (NSString *)dayDescriptionOfDay:(NSInteger)day{
    //chinese
    if ([[NSBundle currentLanguage] hasPrefix:@"zh-Hans"]){
        return [NSString stringWithFormat:@"%zi日",day];
    }
    
    return [NSString stringWithFormat:@"%zi%@",day,[self ordinalNumberSuffixWithNumber:day]];
}

+ (NSString *)dayDescriptionOfDate:(NSDate *)date{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"dd";
    NSUInteger day = [[formatter stringFromDate:date]integerValue];
    return [self dayDescriptionOfDay:day];
}

+ (NSString *)dateDescriptionOfDate:(NSDate *)date{

    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"yyyy";
    NSUInteger year = [[formatter stringFromDate:date]integerValue];
    
    if ([[NSBundle currentLanguage] hasPrefix:@"zh-Hans"]){
        
        formatter.dateFormat = @"MM";
        NSUInteger month = [[formatter stringFromDate:date]integerValue];
        formatter.dateFormat = @"dd";
        NSUInteger day = [[formatter stringFromDate:date]integerValue];
        
        return [NSString stringWithFormat:@"%zi年%zi月%zi日",year,month,day];
    }else{
        NSString *monthString = [self monthDescriptionOfDate:date];
        NSString *dayString = [self dayDescriptionOfDate:date];
        return [NSString stringWithFormat:@"%@ %@ %zi",dayString,monthString,year];
    }
}

//+ (NSString *)dayDescriptionOfDate:(NSDate *)date{
//    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
//    formatter.dateFormat = @"dd";
//    NSUInteger day = [[formatter stringFromDate:date]integerValue];
//    return [NSString stringWithFormat:@"%@%@",@(day),NSLocalizedString(@"CalanderDay", nil)];
//}

+ (NSString *)resultDescriptionOfResult:(TargetResult)result{
    switch (result) {
        case TargetResultProgressing:
            return NSLocalizedString(@"Progressing", nil);
        case TargetResultComplete:
            return NSLocalizedString(@"Completed", nil);
        case TargetResultFail:
            return NSLocalizedString(@"Fail", nil);
        case TargetResultStop:
            return NSLocalizedString(@"End", nil);
    }
}

+ (NSString *)signTypeDescriptionOfType:(TargetSignType)type{
    switch (type) {
        case TargetSignTypeSign:
            return NSLocalizedString(@"Signed", nil);
        case TargetSignTypeLeave:
            return NSLocalizedString(@"Leave", nil);
    }
}

@end
