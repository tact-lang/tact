message MyMessage {
    value: Int;
}

contract TestUnderscore {
    // Test: Using underscore to discard the parameter in a typed binary receiver
    receive(_: MyMessage) {
        // empty body
    }
}
