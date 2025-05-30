contract TestTextReceiver {
    receive("hello") {
        // receiver that matches exact text "hello"
    }
}
