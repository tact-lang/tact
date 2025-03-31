contract TestUnderscore {
    result: Int = 0;
    
    // Receiver with underscore parameter discarding the message
    receive(_: String) {
        self.result = 777;
    }
}
