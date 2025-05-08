contract TestSliceFallback {
    // Fallback receiver for unmatched binary messages
    receive(msg: Slice) {
        // This should catch all binary messages not matched by earlier receivers
    }

    fun dummy() : Int {
        return 0;
    }
}
