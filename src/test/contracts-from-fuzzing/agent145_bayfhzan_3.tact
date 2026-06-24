contract Test {
    // Valid text literal receiver function: matches messages with exact text "hello"
    receive("hello") {
        return;
    }
}
