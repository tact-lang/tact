contract Test {
    x: Int = 0;

    // Test 1: Basic empty receive() for empty messages
    receive() {
        self.x = 10;
    }
}
