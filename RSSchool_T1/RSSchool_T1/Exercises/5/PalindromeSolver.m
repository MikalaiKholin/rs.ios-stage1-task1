#import "PalindromeSolver.h"

@implementation PalindromeSolver

// Complete the highestValuePalindrome function below.
- (NSString *) highestValuePalindrome:(NSString *)s n:(NSNumber *)n k:(NSNumber *)k {
    
    NSMutableArray *number = [[NSMutableArray alloc] initWithArray:[self stringToArray:s]] ;
    
    
    
    NSLog(@"%i-----", [[NSString stringWithFormat:@"%c", [s characterAtIndex:1]] intValue]);
    NSLog(@"%@", number);
    
    int numberOfReplacments = [k intValue];
    
    for (int i=0; i<number.count; i++) {
        int leftNumber = [[number objectAtIndex:i]intValue];
        int rightNumber = [[number objectAtIndex:number.count-1-i]intValue];
        NSLog(@"r=%i   l=%i", rightNumber, leftNumber);
        if (leftNumber > rightNumber){
            number[number.count-1-i] = [NSNumber numberWithInt:leftNumber];
            numberOfReplacments--;
        }
        else if (leftNumber < rightNumber)
        {
            number[i] = [NSNumber numberWithInt:rightNumber];
            numberOfReplacments--;
        }
        if (numberOfReplacments < 0){
            return @"-1";
        }
    }
    NSLog(@"nor=%i", numberOfReplacments);
    if (numberOfReplacments>0) {
        
        number = [self addNines:number :numberOfReplacments+1];
    }
    
    return [[number valueForKey:@"description"] componentsJoinedByString:@""];
}

- (NSArray *)stringToArray:(NSString *)str {
    NSMutableArray *mutableArray = [[NSMutableArray alloc] init];
    
    for (int i=0; i<str.length; i++) {
        int t = [[NSString stringWithFormat:@"%c", [str characterAtIndex:i]] intValue];
        [mutableArray addObject:[NSNumber numberWithInt:t]];
    }

    return mutableArray;
}

- (NSArray *)addNines:(NSArray *)array :(int) quantityOfNines {
    NSMutableArray *mutableArray = [[NSMutableArray alloc] initWithArray:array];
    
    if ((quantityOfNines%2!=0)&&(mutableArray.count%2!=0)){
        mutableArray[mutableArray.count/2+1]=[NSNumber numberWithInt:9];
        quantityOfNines--;
    }
    
    if (quantityOfNines>=2){
        int j=0;
        for (int i=quantityOfNines ; i>0 ; i=-2){
            mutableArray[j] = [NSNumber numberWithInt:9];
            mutableArray[mutableArray.count-1-j] = [NSNumber numberWithInt:9];
            j++;
            if (j>= mutableArray.count/2){
                return mutableArray;
            }
        }
    }
    
    return mutableArray;
}

@end
