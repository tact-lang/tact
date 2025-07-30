message MyMsg {
    x: Int;
}

contract TestAllReceivers {
    // Receiver for empty internal messages
    receive() {
        // Executed when an empty message arrives
    }
    
    // Receiver for specific text comment messages (exact match "text")
    receive("text") {
        // Executed when message comment is exactly "text"
    }
    
    // Receiver for arbitrary text messages
    receive(str: String) {
        // Executed for any text message not matched by specific comment
    }
    
    // Receiver for typed binary messages
    receive(msg: MyMsg) {
        // Executed when a binary message of type MyMsg arrives
    }
    
    // Fallback receiver for binary messages (Slice)
    receive(msg: Slice) {
        // Executed for any binary message not matched above
    }
}
