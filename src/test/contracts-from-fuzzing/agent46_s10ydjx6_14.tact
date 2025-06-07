message MyMsg {
    a: Int;
}

contract Test {
    receive() {
        // handles empty messages
    }

    receive("hello") {
        // handles specific text message "hello"
    }

    receive(str: String) {
        // handles arbitrary text messages
    }

    receive(msg: MyMsg) {
        // handles typed binary messages
    }

    receive(msg: Slice) {
        // fallback for unmatched binary messages
    }
}
