message MyMessage {
    value: Int;
}

contract MixedReceiver {
    // Contract containing all receiver types to test matching order (documentation order)

    // 1. Empty message receiver
    receive() {
        // Handle empty message
    }

    // 2. Specific text receiver for "hello"
    receive("hello") {
        // Handle text message "hello"
    }

    // 3. Arbitrary text receiver
    receive(str: String) {
        // Handle any text message
    }

    // 4. Typed binary message receiver
    receive(msg: MyMessage) {
        let _x: Int = msg.value;
    }

    // 5. Fallback receiver for unmatched binary messages
    receive(msg: Slice) {
        // Fallback handling
    }
}
