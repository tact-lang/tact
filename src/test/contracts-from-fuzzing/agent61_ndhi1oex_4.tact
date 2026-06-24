contract Test {
    received: Int = 0;

    // Specific text receiver
    receive("hello") {
        self.received = 2;
    }
}
