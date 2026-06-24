contract Test {
    state: Int = 0;
    
    // Receiver for specific text comment "hello"
    receive("hello") {
        self.state = 42;
    }
}
