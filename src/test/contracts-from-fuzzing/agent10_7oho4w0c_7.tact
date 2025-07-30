message SomeMsg {
    value: Int;
}

contract TestUnderscore {
    // Using underscore to discard the received message content
    receive(_: SomeMsg) {
        // No need to reference the message
    }
}
