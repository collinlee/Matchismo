//
//  Card.h
//  Matchismo
//
//  Created by Collin Lee on 2/26/14.
//  Copyright (c) 2014 Collin Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

- (int)match:(NSArray *)otherCards;

@end
