contract Test11 {
    // Test 11: Ambiguous message matching between specific text and arbitrary text receivers
    // According to the documentation, a message with comment "test" should be matched by the specific text receiver,
    // not by the arbitrary text receiver.
    
    receive("test") {
        // Handle specific text message "test"
    }

    receive(str: String) {
        // Handle arbitrary text messages
    }
    
    get fun test(): Int {
        return 42;
    }
}
