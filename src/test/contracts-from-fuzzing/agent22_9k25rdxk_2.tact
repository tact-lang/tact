message SomeMessage {
    a: Int;
}

contract TestBounceRaw {
    // Bounce receiver using a raw Slice type
    bounced(rawMsg: Slice) {
        // Process raw slice
    }

    // Dummy receive to ensure contract validity
    receive("dummy") {}
}
