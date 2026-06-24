contract Test {
    textReceived: String = "";

    // Arbitrary text receiver
    receive(str: String) {
        self.textReceived = str;
    }
}
