message MyMessage { value: Int; }

contract DoubleBounce {
    // Bounce receiver with a typed parameter
    bounced(msg: bounced<MyMessage>) {
        // Handle bounced message (typed)
    }

    // Bounce receiver with a raw Slice parameter
    bounced(rawMsg: Slice) {
        // Handle bounced message (raw)
    }
}
