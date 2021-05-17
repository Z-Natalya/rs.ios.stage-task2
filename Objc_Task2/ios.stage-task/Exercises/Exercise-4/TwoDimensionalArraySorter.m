#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    NSMutableArray *numbersArray = [[NSMutableArray alloc] init];
    NSMutableArray *stringsArray = [[NSMutableArray alloc] init];
    
    for (NSArray *subArray in array) {
        if (![subArray isKindOfClass:[NSArray class]]) {
            return @[];
        }
        
        if (subArray.count == 0) {
            continue;
        }
        
        if ([subArray.firstObject isKindOfClass:[NSNumber class]]) {
            [numbersArray addObjectsFromArray:subArray];
        }
        
        if ([subArray.firstObject isKindOfClass:[NSString class]]) {
            [stringsArray addObjectsFromArray:subArray];
        }
    }
    
    if (stringsArray.count == 0) {
        return [numbersArray sortedArrayUsingSelector:@selector(compare:)];
    }
    
    if (numbersArray.count == 0) {
        return [stringsArray sortedArrayUsingSelector:@selector(compare:)];
    }
    
    NSSortDescriptor* sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO selector:@selector(localizedCompare:)];
    return @[[numbersArray sortedArrayUsingSelector:@selector(compare:)], [stringsArray sortedArrayUsingDescriptors:@[sortDescriptor]]];

}

@end
