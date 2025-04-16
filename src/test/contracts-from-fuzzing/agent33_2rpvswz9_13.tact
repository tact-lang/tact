message MyMessage {
    value: Int;
}

contract Test {
    // Receiver with underscore to discard the typed message parameter
    receive(_: MyMessage) {
        // no-operation
    }
}
