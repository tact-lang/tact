// Test 4: Multiple bounced receivers in one contract

message Msg1 { data: Int; }
message Msg2 { data: String; }

contract BounceMultiple {
    // Specific bounce handler for Msg1
    bounced(msg: bounced<Msg1>) {
        // Process bounced Msg1
    }

    // Specific bounce handler for Msg2
    bounced(msg: bounced<Msg2>) {
        // Process bounced Msg2
    }

    // Fallback bounce handler for all other bounced messages
    bounced(rawMsg: Slice) {
        // Fallback processing
    }
}
