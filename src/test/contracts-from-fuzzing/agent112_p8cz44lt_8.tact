contract Test {
    // Receiver function using underscore to discard unused parameter
    receive(_: String) {
        // Parameter is discarded
        let a = 42;
    }
}
