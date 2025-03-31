contract Test {
    state: Int = 0;
    
    // Receiver for empty messages
    receive() {
        self.state += 1;
    }
}
