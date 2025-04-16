message MyMessage {
    a: Int;
}

contract Test {
    // Test receiver with typed message using a proper message definition
    receive(msg: MyMessage) {}
}
