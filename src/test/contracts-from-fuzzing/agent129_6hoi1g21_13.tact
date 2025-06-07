message MyMessage {
    value: Int;
}

contract Test {
    // Test 13: Receiver with underscore for typed message parameter
    receive(_: MyMessage) {}
}
