contract Test7 {
    // Testing fallback binary message receiver with underscore discard parameter
    receive(_: Slice) {
        // Handling all unmatched binary messages without explicit parameter usage
    }

    get fun dummy(): Int {
        return 123;
    }
}
