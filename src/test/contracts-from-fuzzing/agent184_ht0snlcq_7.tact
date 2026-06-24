message MyMsg {
    value: Int;
}

contract Test {
    // Using underscore to discard the message parameter
    receive(_: MyMsg) {
        // No operation needed
    }
}
