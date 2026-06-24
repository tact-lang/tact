contract TestReceiverAmbiguous {
    // Test to confirm matching order: literal receiver should match over arbitrary text receiver
    receive("hello") {
        // literal handler
    }

    receive(msg: String) {
        // arbitrary text handler
    }
}
