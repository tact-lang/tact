message MyMessage {
    value: Int;
}

contract Test5 {
    // Test for receive with a typed binary message receiver using an underscore to discard the parameter
    receive(_: MyMessage) {
        // no usage of the message parameter
    }
}
