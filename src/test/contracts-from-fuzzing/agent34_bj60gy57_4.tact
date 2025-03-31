contract Test {
    lastMsg: String = "";

    // Arbitrary text message receiver
    receive(str: String) {
        self.lastMsg = str;
    }
}
