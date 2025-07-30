message MyMessage {
    value: Int;
}

contract Test {
    // Receivers declared in documentation order, even if declaration order is different, matching order is fixed by the specification
    receive() {
        // for empty messages
    }

    receive("hello") {
        // for messages with specific text comment "hello"
    }

    receive(str: String) {
        // for arbitrary text messages
    }

    receive(msg: MyMessage) {
        // for binary messages matching the MyMessage type
        let x = msg.value;
    }

    receive(msg: Slice) {
        // fallback for unmatched binary messages
        let _ = msg;
    }
}
