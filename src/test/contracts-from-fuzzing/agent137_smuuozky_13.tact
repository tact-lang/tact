contract TestMultipleFixedText {
    // Two fixed text receivers with different literal strings. This should compile successfully.
    receive("hello") {
        // Handler for "hello" messages
    }
    
    receive("world") {
        // Handler for "world" messages
    }
}
