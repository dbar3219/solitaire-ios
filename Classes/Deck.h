
// Solitaire for iOS
// tepaanan@gmail.com
// FINLAND


#import <Foundation/Foundation.h>
#import "Card.h"

//#define CARD_CAP 15;

typedef enum {
    ESource,
    ETarget,
    EWaste1,
    EWaste2
} DeckType;


@interface Deck : NSObject {
    
    NSMutableArray* _cardArray;
    int _deckId;
	CGRect _deckRect;
    CGRect _drawRect;
    int _deckZ;
    DeckType _deckType;
    int _cardCap;
    
    
}



- (id)initWithData:(int)x:(int)y:(int)dId:(int)width:(int)height:(DeckType)type;
- (void)setNewPos:(int)x:(int)y;
- (void)addCard:(Card*)card;
- (void)removeCard:(Card*)card;
- (void)drawDeck:(CGRect)rect; 
- (Card*)getCardAtPos:(CGPoint)point;
- (Card*)getTopCard;
- (void)dealloc;


@property (nonatomic, retain) NSMutableArray* cardArray;
@property (assign) int deckId;
@property (assign) CGRect deckRect;
@property (assign) int deckZ;
@property (assign) DeckType deckType;
@property (assign) CGRect drawRect;
@property (assign) int cardCap;

@end
