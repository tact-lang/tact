message MyMessage {
    a: Int;
}

contract Test {
    // Test using underscore parameter in typed binary receiver
    receive(_: MyMessage) {
        // receiver with discarded parameter
    }
}
