contract TestNoFallback {
    // Only a text-specific receiver is declared; no fallback receiver for unmatched binary messages
    receive("hello") {
        // Process message with comment "hello"
    }

    // At runtime, any binary messages (or any message not matching "hello") will cause the transaction to fail with exit code 130
    // per the documented behavior.
}
