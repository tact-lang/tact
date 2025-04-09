contract Test {
    // Receiver with underscore to discard the String parameter
    receive(_ : String) {
        // processing without using the message parameter
    }

    // Receiver with underscore to discard the Slice parameter for fallback
    receive(_ : Slice) {
        // fallback handling without using the payload
    }
}
