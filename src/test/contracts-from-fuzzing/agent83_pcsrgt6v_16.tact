// Test: Reversed ordering of literal and arbitrary text receivers
contract Test {
    x: Int = 0;

    // Arbitrary text message receiver comes first
    receive(str: String) {
        self.x = 2; // should trigger for any text message
    }

    // Specific text comment receiver should have higher precedence
    receive("hello") {
        self.x = 1; // should trigger when message exactly "hello" is sent
    }
}
