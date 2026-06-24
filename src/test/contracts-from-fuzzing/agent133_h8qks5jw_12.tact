contract Test9 {
    x: Int = 0;

    // Test 9: Specific text receiver takes precedence over arbitrary text receiver
    receive("x") {
        self.x = 1;
    }

    receive(str: String) {
        self.x = 2;
    }
}
