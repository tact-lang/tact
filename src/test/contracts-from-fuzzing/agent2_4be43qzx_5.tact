contract Test {
    msgReceived: String = "";

    // Receiver for arbitrary string messages
    receive(str: String) {
        self.msgReceived = str;
    }
}
