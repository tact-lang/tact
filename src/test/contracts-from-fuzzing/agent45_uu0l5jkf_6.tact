contract ArbitraryTextReceiver {
    x: Int = 0;

    // Receiver for arbitrary text messages, parameter 'str' is not used
    receive(str: String) {
        self.x = 10;
    }
}
