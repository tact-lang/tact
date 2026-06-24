contract Test {
    receive() {
        // Valid: discarding a local value using wildcard, without accessing it
        let _ = 123;
    }
}
