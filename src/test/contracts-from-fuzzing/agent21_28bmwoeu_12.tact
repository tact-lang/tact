message Msg {
    a: Int;
}

contract Test {
    // 4. Typed binary message receiver using a declared message type
    receive(msg: Msg) {
        // Handler for typed binary messages
    }
}
