contract Test6 {
    // Testing fallback binary message receiver using Slice
    receive(msg: Slice) {
        // This function should handle all unmatched binary messages
    }

    get fun dummy(): Int {
        return 999;
    }
}
