contract TestEmpty {
    received: Int = 0;
    
    // Test basic empty receiver
    receive() {
        self.received = 1;
    }
}
