//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Collin Lee on 2/25/14.
//  Copyright (c) 2014 Collin Lee. All rights reserved.
//

#import "CardGameViewController.h"
#import "Card.h"
#import "Deck.h"
#import "PlayingCardDeck.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) Deck *deck;
@end

@implementation CardGameViewController
- (Deck *) deck
{
    if (!_deck) {
        _deck = [[PlayingCardDeck alloc] init];
    }
    return _deck;
}

- (void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    NSString *label = [NSString stringWithFormat:@"Flips %d", self.flipCount];
    self.flipsLabel.text = label;
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    if (self.flipCount > 52) {
        //Do something here to show all cards have been flipped
    } else if ([sender.currentTitle length]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    } else {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                          forState:UIControlStateNormal];
        NSLog(@"Count of deck = %d", [self.deck count]);
        Card *card = [self.deck drawRandomCard];
        NSLog(@"Contents = %@", card.contents);
        [sender setTitle:card.contents forState:UIControlStateNormal];
    }
    self.flipCount++;
}

@end
