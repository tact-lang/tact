contract TestComment {
    // Test for specific text comment receiver
    receive("hello") {
        // Successfully called only for comment "hello"
    }
}
