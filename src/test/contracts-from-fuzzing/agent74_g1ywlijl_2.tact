contract TestEmpty {
    received: Int = 0;

    // Test for empty message receiver
    receive() {
        self.received = 1;
    }
}
