#import "MiniMaxArrayConverter.h"

@implementation MiniMaxArrayConverter

// Complete the convertFromArray function below.
- (NSArray<NSNumber*>*)convertFromArray:(NSArray<NSNumber*>*)array {
    int sum = [[array valueForKeyPath: @"@sum.self"]intValue];
    int max = [[array valueForKeyPath:@"@max.self"]intValue];
    int min = [[array valueForKeyPath:@"@min.self"]intValue];
    NSNumber *maxSum = [NSNumber numberWithInt:(sum - min)];
    NSNumber *minSum = [NSNumber numberWithInt:(sum - max)];
    
    return @[minSum, maxSum];
}

@end
