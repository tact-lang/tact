contract Test {
    // literal text receiver: handles messages with the exact text "hello"
    receive("hello") {
    }

    // contract receiver to trigger compilation fully
    // This is necessary to ensure the receiver function is used
    receive() {}
}
