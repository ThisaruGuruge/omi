import ballerina/io;
import thisaru/deck;

# Prints `Hello World`.

public function main() {
    io:println("Hello World!");
    deck:Value[] values = [deck:ACE, deck:SEVEN, deck:EIGHT, deck:NINE, deck:TEN, deck:JACK, deck:QUEEN, deck:KING];
    deck:Deck deck = new();
    deck.shuffle();
    deck:Card[] cards = deck.getAllCards();
    foreach deck:Card card in cards {
        io:print(card.suit.toString() + card.value.toString() + " ");
    }
}
