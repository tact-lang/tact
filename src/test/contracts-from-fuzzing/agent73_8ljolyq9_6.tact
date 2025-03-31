message MyMsg { value: Int; }

contract Test {
    // Receiver using underscore to discard parameter
    receive(_: MyMsg) {
        // receiver that discards the message
    }
}
