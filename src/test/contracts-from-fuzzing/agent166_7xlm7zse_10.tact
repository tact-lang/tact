contract TestReceiverPriority {
    // Receiver for specific literal text message "hi"
    receive("hi") { 
        // Expected to match literal string "hi"
    }

    // Receiver for arbitrary text messages
    receive(str: String) { 
        // Expected to match any text message not matched by literal receivers
        let _ = str;
    }

    // Fallback receiver for binary messages
    receive(msg: Slice) { 
        // Expected to match all unmatched binary messages
        let _ = msg;
    }
}
