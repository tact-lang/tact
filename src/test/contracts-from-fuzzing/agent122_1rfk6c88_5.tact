contract TestFallback {
    // Fallback receiver that catches any binary message not matched by previous receivers
    receive(msg: Slice) {
        // simple fallback behavior
        let x = 1;
    }
}
