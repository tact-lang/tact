message Msg {
    value: Int;
}

// Test 1: Bounce receiver using a raw Slice parameter
contract BounceReceiverRaw {
    bounced(rawMsg: Slice) {
        // Process bounced message as a raw slice (generic handling)
        return;
    }
}
