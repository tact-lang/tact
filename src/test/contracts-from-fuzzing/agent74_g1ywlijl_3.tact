contract TestText {
    received: Int = 0;

    // Receiver for specific literal text message
    receive("hello") {
        self.received = 2;
    }
}
