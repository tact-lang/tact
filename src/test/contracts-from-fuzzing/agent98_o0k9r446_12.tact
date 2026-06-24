contract Test {
    // Specific text receiver and arbitrary text receiver coexist without conflict
    receive("foo") { /* handles message with exact comment "foo" */ }
    receive(str: String) { /* handles all other text messages */ }

    // Fallback receiver for unmatched binary messages
    receive(msg: Slice) { /* handles all unmatched binary messages */ }
}
