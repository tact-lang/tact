message MyMsg {
    a: Int;
}

contract Test {
    // Using underscore to discard the receiver parameter
    receive(_: MyMsg) {
        // Parameter is discarded and not used
    }
}
