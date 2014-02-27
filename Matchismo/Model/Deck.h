//
//  Deck.h
//  Matchismo
//
//  Created by Collin Lee on 2/26/14.
//  Copyright (c) 2014 Collin Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
@interface Deck : NSObject
- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;
- (int)count;
- (Card *)drawRandomCard;
@end
