contract Test7 {
    // Receiver using underscore to discard a String message parameter
    receive(_: String) {
        // do nothing
    }
}
