contract TestSliceReceiver {
    // Fallback receiver function for unmatched binary messages
    receive(msg: Slice) {
        // No operation; this receiver should catch any binary message not matched by other receivers
    }
}
