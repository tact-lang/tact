contract TestReceiverOrderSwitch {
    flagEmpty: Bool = false;
    flagText: Bool = false;
    flagSpecific: Bool = false;
    flagFallback: Bool = false;

    // Fallback receiver for binary messages
    receive(msg: Slice) {
        self.flagFallback = true;
    }

    // Empty message receiver (should catch empty messages even if declared later)
    receive() {
        self.flagEmpty = true;
    }
    
    // Specific text receiver for "hello" messages
    receive("hello") {
        self.flagSpecific = true;
    }
    
    // Arbitrary text receiver
    receive(str: String) {
        self.flagText = true;
    }
}
