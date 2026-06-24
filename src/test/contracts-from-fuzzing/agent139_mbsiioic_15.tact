message MyMsg {
    a: Int;
}

contract Test {
    // Test: Using underscore to discard parameter in a typed binary message receiver
    receive(_: MyMsg) {
        // Body intentionally empty
    }
}
