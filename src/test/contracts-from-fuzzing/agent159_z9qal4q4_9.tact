message MyMessage {
    value: Int;
}

contract Test {
    // Test 6: Using underscore to discard a parameter in a typed binary receiver
    receive(_: MyMessage) {
        // Parameter is intentionally discarded
    }
}
