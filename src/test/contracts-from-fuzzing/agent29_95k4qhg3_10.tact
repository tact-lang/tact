contract Test {
    // Test 10: Receiver prioritization - literal vs arbitrary
    counter: Int;

    init() {
        self.counter = 0;
    }

    // Literal receiver for exact text "hello"
    receive("hello") {
        // For message with comment "hello", set counter to 1
        self.counter = 1;
    }

    // Arbitrary text receiver for all other text messages
    receive(msg: String) {
        // For any other text message, set counter to 2
        self.counter = 2;
    }
}
