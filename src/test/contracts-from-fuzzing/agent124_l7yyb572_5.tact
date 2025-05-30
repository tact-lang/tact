contract TestRecvStr {
    received: String = "";

    // Receiver for arbitrary text messages
    receive(str: String) {
        self.received = str;
    }
}
