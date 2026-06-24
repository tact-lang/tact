contract Test {
    received: Int = 0;
    
    // empty message receiver
    receive() {
        self.received = 1;
    }
}
