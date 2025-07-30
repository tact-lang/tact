contract TestBinaryReceiver {
    // Receiver for binary messages using Slice.
    receive(msg: Slice) {
        // Fallback handling for binary messages
    }

    // Getter to ensure inclusion in compilation
    get fun test(): Int {
        return 0;
    }
}
