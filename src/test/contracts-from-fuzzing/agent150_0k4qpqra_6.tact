message MyMessage {
    value: Int;
}

contract Test3 {
    // Test for receive with a typed binary message receiver using the field in a require() expression
    receive(msg: MyMessage) {
        require(msg.value > 0, "Value must be positive");
    }
}
