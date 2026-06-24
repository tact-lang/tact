contract Test {
    // Test case: Contract with overlapping receivers for text messages
    // When a message with comment "dupTest" is received, the specific receiver should be invoked
    receive("dupTest") { 1; }
    // This receiver handles arbitrary text messages
    receive(str: String) { 2; }

    // Fallback for binary messages
    receive(msg: Slice) { 3; }
}
