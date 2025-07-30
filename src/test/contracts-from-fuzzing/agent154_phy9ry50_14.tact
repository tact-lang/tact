contract Test {
    // External receiver with a typed parameter (Slice) instead of a literal text comment
    external(msg: Slice) {
        // Accept external message; note that external messages don't have a sender
        acceptMessage();
    }
}
