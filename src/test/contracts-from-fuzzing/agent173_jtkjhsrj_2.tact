contract Test {
    // Receiver for a specific text comment
    receive("hello") {
        // handle message "hello"
    }

    // Dummy function to ensure receiver is compiled
    get fun test(): Int {
        return 1;
    }
}