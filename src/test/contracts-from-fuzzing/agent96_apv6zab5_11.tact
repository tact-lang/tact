contract TestNoFallback {
    // Only a receiver for text "hello" is declared.
    // Not declaring a fallback receiver. 
    receive("hello") {
    }
}
