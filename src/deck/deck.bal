import ballerina/math;

public type Deck object {
    private Card[] cards;
    private Suit[] suits;
    private Value[] values;

    public function init(Value[]? values = (), Suit[]? suits = ()) {
        self.cards = [];
        if (suits is ()) {
            self.suits = [SPADES, HEARTS, CLUBS, DIAMONDS];
        } else {
            self.suits = suits;
        }
        if (values is ()) {
            self.values = [ACE, TWO, THREE, FOUR, FIVE, SIX, SEVEN, EIGHT, NINE, TEN, JACK, QUEEN, KING];
        } else {
            self.values = values;
        }

        foreach Suit suit in self.suits {
            foreach Value value in self.values {
                Card card = {
                    suit: suit,
                    value: value
                };
                self.cards.push(card);
            }
        }
    }

    public function shuffle() {
        Card[] newCards = [];
        while (self.cards.length() > 0) {
            int nextCardIndex = <int>math:randomInRange(0, self.cards.length());
            Card newCard = self.cards.remove(nextCardIndex);
            newCards.push(newCard);
        }
        self.cards = newCards;
    }

    public function getAllCards() returns Card[] {
        return self.cards;
    }

    public function issue(int amount = 1) returns Card[] {
        Card[] result = [];
        int i = 0;
        while (i < amount) {
            result.push(self.cards.pop());
            i += 1;
        }

        return result;
    }

    public function print() {
        foreach Card card in self.cards {
            printCard(card);
        }
    }
};
