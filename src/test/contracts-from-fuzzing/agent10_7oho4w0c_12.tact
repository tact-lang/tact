message MyMsg {
    value: Int;
}

// This contract combines all receiver types to verify matching priority:
// 1. receive() for empty messages
// 2. receive("hello") for a specific text message
// 3. receive(str: String) for arbitrary text messages
// 4. receive(msg: MyMsg) for typed binary messages
// 5. receive(msg: Slice) as a fallback for unmatched binary messages

contract TestAllReceivers {
    receive() {
        // empty receiver
    }

    receive("hello") {
        // specific text receiver
    }

    receive(str: String) {
        // arbitrary text receiver
    }

    receive(msg: MyMsg) {
        // typed binary message receiver
    }

    receive(msg: Slice) {
        // fallback receiver for unmatched binary messages
    }
}
