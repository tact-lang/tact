contract TestArbString {
    result: Int = 0;
    
    // Receiver for arbitrary text messages
    receive(str: String) {
        self.result = 123;
    }
}
