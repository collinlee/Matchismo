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
@property (nonatomic) Deck *deck;
@property (nonatomic) int initialCount;
@end

@implementation CardGameViewController
- (Deck *) deck
{
    if (!_deck) {
        _deck = [[PlayingCardDeck alloc] init];
        _initialCount = [_deck count];
    }
    return _deck;
}

- (void)setInitialCount:(int)initialCount
{
    _initialCount = initialCount;
}

- (void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    NSString *label = [NSString stringWithFormat:@"Flips %d", self.flipCount];
    self.flipsLabel.text = label;
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    if (self.flipCount > self.initialCount) {
        //Show green background image when cards exhausted
        [sender setBackgroundImage:[UIImage imageNamed:@"green"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    } else if ([sender.currentTitle length]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    } else {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                          forState:UIControlStateNormal];
        Card *card = [self.deck drawRandomCard];
        [sender setTitle:card.contents forState:UIControlStateNormal];
    }
    self.flipCount++;
}

@end
