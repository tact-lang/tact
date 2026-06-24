contract TestUnderscoreFallback {
    // Test fallback receiver using underscore to discard the message parameter
    receive(_: Slice) {
        let a = 1;
    }
}
