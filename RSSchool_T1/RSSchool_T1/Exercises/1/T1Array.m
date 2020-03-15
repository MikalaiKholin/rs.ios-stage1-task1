#import "T1Array.h"

@implementation T1Array

// Complete the following fuction
- (NSArray *)convertToHappy:(NSArray *)sadArray {
    
    if (sadArray == nil || [sadArray count] < 3) {
        return @[];
    }
    
    bool isHappy = false;
    NSArray *happyArray = [[NSArray alloc] init];
    
    while(!isHappy){
        NSArray *arr1 = [[NSArray alloc] initWithArray:[self makeHappy:sadArray]];
        NSArray *arr2 = [[NSArray alloc] initWithArray:[self makeHappy:arr1]];
        if ([arr1 isEqualToArray:arr2]){
            isHappy = true;
            happyArray = arr1;
        }
        
    }

    return happyArray;
}

- (NSArray *)makeHappy:(NSArray *)array {
    NSMutableArray *mutableArray = [[NSMutableArray alloc] initWithArray:array];
    for (int i=mutableArray.count-1; i>=2; i--) {
        int sum = [[mutableArray objectAtIndex:i]intValue] + [[mutableArray objectAtIndex:i-2]intValue];
        int num = [[mutableArray objectAtIndex:i-1]intValue];
        if (sum<num) {
            [mutableArray removeObjectAtIndex:(i-1)];
        }
    }
    return mutableArray;
}

@end
