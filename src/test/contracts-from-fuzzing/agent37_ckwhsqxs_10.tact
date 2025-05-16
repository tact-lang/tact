message MyMsg {
    a: Int;
}

contract MixedReceivers {
    // 1. Receiver for empty messages
    receive() {
        // handle empty message
    }
    
    // 2. Receiver for specific text message "hello"
    receive("hello") {
        // handle message with comment "hello"
    }
    
    // 3. Receiver for arbitrary text messages
    receive(str: String) {
        // handle arbitrary text message
    }
    
    // 4. Receiver for binary messages of a specific message type
    receive(msg: MyMsg) {
        // handle typed binary message
    }
    
    // 5. Fallback receiver for all unmatched binary messages
    receive(msg: Slice) {
        // handle fallback binary message
    }
}
