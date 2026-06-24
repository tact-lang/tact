contract TestReceiverText {
    flag: Int = 0;

    // Receiver for specific text message
    receive("hello") {
        self.flag = 10;
    }

    // Fallback receiver for other messages
    receive(msg: Slice) {
        self.flag = 20;
    }
}
