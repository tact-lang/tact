message MyMessage {
    x: Int;
}

contract Test4a {
    receive(msg: MyMessage) {
        // No operations
    }
}
