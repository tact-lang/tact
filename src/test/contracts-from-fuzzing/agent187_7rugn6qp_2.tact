contract Test {
    counter: Int = 0;
    
    // Empty message receiver
    receive() {
        self.counter = 1;
    }
}
