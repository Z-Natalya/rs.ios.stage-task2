#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    
    if (numbersArray.count == 0) {
        return @"";
    }
    
    NSMutableString *result = [NSMutableString stringWithString:@""];
    
    for (NSInteger i = 0; i < 4; ++i) {
        if (numbersArray.count - 1 < i) {
            [result appendString:@"0."];
            continue;
        }
        
        if ([numbersArray[i] integerValue] < 0) {
            return @"Negative numbers are not valid for input.";
        }
        
        if ([numbersArray[i] integerValue] > 255) {
            return @"The numbers in the input array can be in the range from 0 to 255.";
        }
        
        [result appendFormat:@"%@.", numbersArray[i]];
    }
    
    return [result substringWithRange:NSMakeRange(0, result.length - 1)];
}

@end
