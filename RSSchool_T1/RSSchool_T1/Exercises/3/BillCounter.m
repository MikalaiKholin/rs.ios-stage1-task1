#import "BillCounter.h"

@implementation BillCounter

// Complete the following fuction
- (NSString*)compareResultForBill:(NSArray<NSNumber*>*)bill notIncludingElementWithIndex:(NSInteger)index withGivenSum:(NSNumber*)sum {
    int sumOfBill = [[bill valueForKeyPath: @"@sum.self"]intValue];
    int notIncludingElementPrice = [[bill objectAtIndex:index]intValue];
    
    if ( ((sumOfBill-notIncludingElementPrice)/2) == [sum intValue]){
        return @"Bon Appetit";
    }
    {
        //NSString *refund = (@"%i", notIncludingElementPrice);
        return [NSString stringWithFormat:@"%i", [sum intValue] - ((sumOfBill-notIncludingElementPrice)/2)];
    }
    
    
}

@end
