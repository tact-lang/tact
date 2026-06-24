contract Test3 {
    x: Int = 0;

    // Test 3: Receiver with string parameter for arbitrary text messages
    receive(str: String) {
        self.x = 20;
    }
}
