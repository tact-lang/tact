contract TestMissingFallback {
    // Test: Contract with a specific text receiver but no fallback binary receiver
    // When a binary message is sent that doesn't match any receiver, the transaction should fail with exit code 130 at runtime.
    // Note: This behavior is observed during runtime execution, not at compile time.
    receive("hello") {
        // Specific text receiver
    }
}
