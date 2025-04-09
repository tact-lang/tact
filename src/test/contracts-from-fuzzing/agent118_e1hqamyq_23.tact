message MyMessage {
    value: Int;
}

contract TestInvalidExternalType {
    // Test: External receiver with a typed binary parameter should produce a compilation error
    external(msg: MyMessage) {
        // body
    }
}
