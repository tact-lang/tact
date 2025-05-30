message Msg {
    value: Int;
}

contract TestPriority {
    // Receiver for empty message
    receive() {
        let a: Int = 1;
    }

    // Receiver for specific text comment "ping"
    receive("ping") {
        let a: Int = 2;
    }

    // Receiver for arbitrary text messages
    receive(str: String) {
        let a: Int = 3;
    }

    // Receiver for binary message of type Msg
    receive(msg: Msg) {
        let a: Int = msg.value;
    }

    // Fallback receiver for all other binary messages
    receive(msg: Slice) {
        let a: Int = 4;
    }
}
