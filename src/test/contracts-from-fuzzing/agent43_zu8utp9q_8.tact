contract TestCombined {
    // Test 8: Combine specific text receiver and general text receiver.
    // According to documented order, a message with text "hello" should match the specific text receiver, not the generic one.
    receive("hello") { /* specific text receiver */ }
    
    // The general text receiver
    receive(str: String) { /* general text receiver */ }

    // For binary messages, the fallback should be used when no other typed receiver matches.
    receive(msg: Slice) { /* fallback binary receiver */ }

    // An empty message receiver for further differentiation, and should have highest priority for empty messages.
    receive() { /* empty receiver */ }
}
