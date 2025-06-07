contract Test {
    // Receiver for text "hello"
    receive("hello") {}
    
    // Receiver for text "world"
    receive("world") {}
    
    // Fallback empty message receiver
    receive() {}
}
