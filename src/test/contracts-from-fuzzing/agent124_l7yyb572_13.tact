contract TestReceiverOrder {
    flag: Int = 0;

    // Fallback binary receiver declared first
    receive(msg: Slice) {
        self.flag = 1;
    }

    // Specific text receiver declared later
    receive("text") {
        self.flag = 2;
    }
}
