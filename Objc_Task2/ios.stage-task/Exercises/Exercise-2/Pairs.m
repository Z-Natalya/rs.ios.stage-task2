#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
    NSInteger result = 0;
    for (NSInteger i = 0; i < array.count; i++) {
        for (NSInteger j = i + 1; j < array.count; j++) {
            if (ABS(array[i].intValue - array[j].intValue) == number.intValue ) {
                result += 1;
            }
        }
    }
    return result;
}
@end
