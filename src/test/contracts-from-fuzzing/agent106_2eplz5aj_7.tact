message MyMsg {
    value: Int;
}

contract TestUnderscore {
    // Test: Using underscore to discard the message parameter
    receive(_: MyMsg) {
        // Underscore denotes that the parameter is intentionally unused
    }
}
