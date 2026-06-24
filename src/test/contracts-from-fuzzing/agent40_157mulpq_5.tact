contract Test {
    // Multiple receivers testing the prioritization order.
    // 1. Specific text message receiver for "special"
    receive("special") {}
    
    // 2. Arbitrary text message receiver - should catch all other text messages not matched by specific.
    receive(str: String) {}
    
    // 3. Fallback receiver for unmatched binary messages.
    receive(msg: Slice) {}

    // Optional empty receiver omitted for this test.
}
