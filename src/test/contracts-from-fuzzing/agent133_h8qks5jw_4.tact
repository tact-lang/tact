contract Test2 {
    x: Int = 0;
    // Test 2: Receiver matching a specific text message "hello"
    receive("hello") {
        self.x = 100;
    }
}
