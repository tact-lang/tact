contract Test3 {
    last: String = "";

    // Arbitrary text message receiver
    receive(str: String) {
        self.last = str;
    }
}
