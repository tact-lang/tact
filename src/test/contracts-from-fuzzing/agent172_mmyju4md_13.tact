contract Test {
    // Test 10: Overlapping text message receivers where a specific comment receiver and a general text receiver coexist.
    // According to documentation, receive("hello") should be preferred over receive(str: String) when message is "hello".
    
    receive("hello") {
        // Dummy operation for specific text receiver
        let tag = 1;
    }

    receive(str: String) {
        // Dummy operation for arbitrary text receiver
        let tag = 2;
    }
}
