import ballerina/io;

public function printCard(Card card) {
    io:println(card.suit.toString() + " " + card.value.toString());
}
