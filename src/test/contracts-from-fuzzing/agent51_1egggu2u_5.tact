contract Test {
    // Testing underscore as a local variable name (should be rejected)
    receive() {
        let _ = 42;
        dump(42);
    }
}
