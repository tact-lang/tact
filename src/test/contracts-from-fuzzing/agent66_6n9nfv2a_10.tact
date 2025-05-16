contract TestAmbiguousReceivers {
    // Literal text receiver for "overlap"
    receive("overlap") {
        // This receiver should match exact string "overlap"
    }

    // Arbitrary text receiver for any string message
    receive(str: String) {
        // This receiver should match any string message if literals don't match
    }
}
