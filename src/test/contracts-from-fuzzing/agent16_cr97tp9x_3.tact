message MyMessage {
    counter: Int;
}

contract BounceTestSlice {
    // Bounce receiver that takes a raw Slice
    bounced(rawMsg: Slice) {
        // simply a fallback for all bounced messages
    }
}
