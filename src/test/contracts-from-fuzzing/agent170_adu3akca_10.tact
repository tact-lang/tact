contract ReceiverOrderSwap {
    // The physical order is different from the documented matching order, but according to documentation, matching order is fixed.
    // Fallback receiver declared first
    receive(msg: Slice) { /* fallback for binary messages */ }

    // Fixed text receiver declared second
    receive("test") { /* handles messages with exact comment "test" */ }

    // Empty message receiver
    receive() { /* handles empty messages */ }

    // Arbitrary text receiver
    receive(str: String) { /* handles arbitrary text messages */ }
}
