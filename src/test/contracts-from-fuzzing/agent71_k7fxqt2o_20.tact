message MyMsg {
    a: Int;
}

contract Test {
    // Receiver for arbitrary text messages
    receive(str: String) {
        // arbitrary text
    }

    // Fallback receiver for all unmatched binary messages
    receive(msg: Slice) {
        // fallback binary message
    }

    // Receiver for fixed text comment "hello"
    receive("hello") {
        // fixed text receiver
    }

    // Receiver for empty messages
    receive() {
        // empty message receiver
    }

    // Receiver for typed binary messages of type MyMsg
    receive(msg: MyMsg) {
        // typed binary message
    }
}
