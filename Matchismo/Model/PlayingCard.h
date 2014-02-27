//
//  PlayingCard.h
//  Matchismo
//
//  Created by Collin Lee on 2/26/14.
//  Copyright (c) 2014 Collin Lee. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;


@end
