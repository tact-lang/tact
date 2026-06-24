///////////////////////////////////////////
// Test 4: Bounce receiver overloading with different parameter types
///////////////////////////////////////////

message PingMsg {
    dummy: Int;
}

contract BounceTest4 {
    // Specific bounce receiver for PingMsg messages
    bounced(msg: bounced<PingMsg>) {
        // No-op
    }

    // Fallback bounce receiver processing any bounced message as a raw slice
    bounced(raw: Slice) {
        // No-op
    }
}
