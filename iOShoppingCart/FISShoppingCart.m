//
//  FISShoppingCart.m
//
//
//  Created by Kenneth Cooke on 6/9/16.
//
//

#import "FISShoppingCart.h"

@implementation FISShoppingCart

-(NSUInteger)calculateTotalPriceInCents{
    NSUInteger totalInCents = 0;
    for (FISItem *item in self.items) {
        totalInCents += item.priceInCents;
    }
    return totalInCents;
}

-(void)addItem:(FISItem *)item{
    [self.items addObject:item];
    
}

-(void)removeItem:(FISItem *)item{
    NSUInteger itemToRemoveIndex =[self.items indexOfObject:item];
    [self.items removeObjectAtIndex:itemToRemoveIndex];
    
}

-(void)removeAllItemsLikeItem:(FISItem *)item{
    [self.items removeObject:item];
    
}

-(void)sortItemsByNameAsc{
    
    NSSortDescriptor *sortNameAsc = [NSSortDescriptor sortDescriptorWithKey: @"name" ascending:YES];
    [self.items sortUsingDescriptors:@[sortNameAsc]];
    
}

-(void)sortItemsByNameDesc{
    
    NSSortDescriptor *sortNameDesc = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:NO];
    [self.items sortUsingDescriptors:@[sortNameDesc]];
    
}

-(void)sortItemsByPriceInCentsAsc{
    
    NSSortDescriptor *sortPriceAsc = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents" ascending:YES];
    [self.items sortUsingDescriptors:@[sortPriceAsc]];
    
}

-(void)sortItemsByPriceInCentsDesc{
    
    NSSortDescriptor *sortPriceDesc = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents" ascending:NO];
    [self.items sortUsingDescriptors:@[sortPriceDesc]];
    
}

-(NSArray *)allItemsWithName:(NSString *)name{
    NSMutableArray *itemNameMatches = [[NSMutableArray alloc]init];
    for (FISItem *item in self.items) {
        if ([item.name isEqualToString:name]) {
            [itemNameMatches addObject:item];
        }
    }
    return itemNameMatches;
}

-(NSArray *)allItemsWithMinimumPriceInCents:(NSUInteger)price{
    NSArray *itemCostsMoreThan = [[NSMutableArray alloc]init];
    NSPredicate *filterForMinimumCost = [NSPredicate predicateWithFormat:@"priceInCents >= %lu",price];
    
    itemCostsMoreThan = [self.items filteredArrayUsingPredicate:filterForMinimumCost];
    
    return itemCostsMoreThan;
}

-(NSArray *)allItemsWithMaximumPriceInCents:(NSUInteger)price{
    NSArray *allItemsWithMaximumPrice = @[];
    NSPredicate *filterForMaximumCost = [NSPredicate predicateWithFormat:@"priceInCents <= %lu",price];
    
    allItemsWithMaximumPrice = [self.items filteredArrayUsingPredicate:filterForMaximumCost];
    
    return allItemsWithMaximumPrice;
}




@end
