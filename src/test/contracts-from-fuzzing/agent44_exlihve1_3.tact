contract TestText {
    result: Int = 0;
    
    // Receiver for specific text "hello"
    receive("hello") {
        self.result = 100;
    }
}
