contract BounceRawTest {
    // Bounce receiver using a raw Slice parameter
    bounced(rawMsg: Slice) {
        // Process the raw bounced message bits
        // For our test, we simply do nothing
    }

    // A dummy receive to allow contract instantiation
    receive() {}
}