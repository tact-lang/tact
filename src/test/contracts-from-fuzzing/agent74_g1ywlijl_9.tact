contract TestAmbiguousReceivers {
    result: Int = 0;

    // Receiver for specific text "increment"
    receive("increment") {
        // This should be prioritized when the message exactly matches "increment"
        self.result = 1;
    }

    // Receiver for arbitrary text messages
    receive(str: String) {
        // This should only trigger if no literal text receiver matches
        self.result = 2;
    }
}
