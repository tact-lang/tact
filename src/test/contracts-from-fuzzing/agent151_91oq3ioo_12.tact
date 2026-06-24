message MyMessage {
    value: Int;
}

contract TestUnderscore {
    // Using underscore to discard message parameter for typed binary message
    receive(_: MyMessage) {
        // Handler ignoring param
    }
}
