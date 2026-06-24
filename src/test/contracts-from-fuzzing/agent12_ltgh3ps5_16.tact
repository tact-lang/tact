message Msg {
    a: Int;
}

contract Test {
    // Typed binary message receiver with discarded parameter
    receive(_: Msg) {
        // Process message of type Msg without using its content
    }

    // Additional empty message receiver
    receive() {
        // Handles empty messages
    }
}
