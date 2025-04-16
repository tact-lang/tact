message MyMsg {
    a: Int;
}

contract Test {
    // Using underscore to discard the message parameter
    receive(_: MyMsg) {
        // no operation
    }
}
