contract Test {
    // Test for typed text receiver: receive(str: String)
    last_message: String = "";

    receive(str: String) {
        self.last_message = str;
    }

    // fallback empty receiver, needed for contract completeness
    receive() {}
}
