// Solitaire for iOS
// tepaanan@gmail.com
// FINLAND

#import "Deck.h"


@implementation Deck

@synthesize cardArray = _cardArray;
@synthesize deckId = _deckId;
@synthesize deckRect = _deckRect;
@synthesize deckZ = _deckZ;


- (id)initWithData:(int)x:(int)y:(int)dId
{
	self = [super init];
    
    if (self)
    {
        // Create card array for the deck
        self.cardArray = [[NSMutableArray alloc] init];

        self.deckZ = 0;
        
        // Set deck size and position
        UIImage* backgroundImage = [UIImage imageNamed:@"Club_ace.png"];
        CGRect rect;
        CGPoint point;
        point.x = x;
        point.y = y;
        rect.origin = point;
        rect.size = backgroundImage.size;
        self.deckRect = rect;
        self.deckId = dId;
        
        [backgroundImage release];
    }
    return self;
}

- (void)dealloc {
    // Rekease array
	[_cardArray release];
    _cardArray = nil;
	// Remember to call base class dealloc
    [super dealloc];
}

- (void)addCard:(Card*)card
{
    // Set card new position
    CGPoint pos;
    pos.x = self.deckRect.origin.x;
    pos.y = self.deckRect.origin.y + (15 * [self.cardArray count]-1);
    [card setPos:pos.x:pos.y];
    
    // Make deck rect larger
    CGRect rec = [self deckRect];
    rec.size = CGSizeMake(rec.size.width, rec.size.height + 15);
    [self setDeckRect:rec];
    
    // Set deck info to card
    [card setDeck:self];
    
    // Set deck internal z order
    [self setDeckZ:self.deckZ+1];
    [card setZOrder:self.deckZ];
    
    // Card ownership is transfered to array
    [self.cardArray addObject:card];    
}

- (void)removeCard:(Card*)card
{
    [self.cardArray removeObject:card];
}



-(void)drawDeck 
{
    for(int i = 0 ; i < [self.cardArray count] ; i++)
	{
        Card* card = [self.cardArray objectAtIndex:i];
		CGPoint drawingTargetPoint = CGPointMake(card.cardRect.origin.x,card.cardRect.origin.y);
		[card.backgroundImage drawAtPoint:drawingTargetPoint];
	}
	
}

- (Card*)getCardAtPos:(CGPoint)point
{
    // Try to find card under (touch) point
    Card* activeCard = nil;
    for(int i = 0 ; i < [self.cardArray count] ; i++)
    {
        Card* card = [self.cardArray objectAtIndex:i];
        if (CGRectContainsPoint(card.cardRect,point))
        {
            if (activeCard==nil)
            {
                activeCard = card;
            }
            else 
            {
                if (card.zOrder > activeCard.zOrder) 
                    activeCard = card;
            }
        
        }		
    }
    // Return fourd card
	return activeCard;
}

@end
