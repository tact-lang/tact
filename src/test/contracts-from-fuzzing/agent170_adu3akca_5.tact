message MyMessage {
    value: Int;
}

contract TestUnderscore {
    // Using underscore to discard the parameter
    receive(_: MyMessage) {
        // do nothing
    }
}
