contract Ambiguous {
    // Receiver for specific text comment and arbitrary string messages
    receive("text") { 
        // This receiver should match the "text" comment messages
    }
    
    receive(str: String) { 
        // This receiver should match arbitrary text messages
    }

    // Fallback for unmatched binary messages
    receive(msg: Slice) { 
        // This acts as fallback
    }
}
