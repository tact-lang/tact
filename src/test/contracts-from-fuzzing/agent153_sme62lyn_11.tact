message MyMsg {
    x: Int;
}

contract Test {
    // Test case: Using underscore to discard receiver parameter for a typed binary message
    receive(_: MyMsg) {
        // No operation, parameter discarded
    }
}
