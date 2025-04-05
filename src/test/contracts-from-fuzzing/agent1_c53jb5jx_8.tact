// Test receiving a simple text comment
contract CommentReceiver {
    receive("Hello world!") { // Receive a specific string literal
        // Do nothing, just check if it compiles
    }
}