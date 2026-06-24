contract Test2 {
    // Receiver for specific text comment 'hello'
    receive("hello") {
        // do nothing
    }

    // Dummy function to ensure usage
    get fun getValue(): Int {
        return 0;
    }
}