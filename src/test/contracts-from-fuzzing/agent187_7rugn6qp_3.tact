contract Test {
    counter: Int = 0;
    
    // Specific text comment receiver
    receive("hello") {
        self.counter = 42;
    }
}
