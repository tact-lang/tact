message SomeMsg {
    data: Int;
}

contract BounceMultiple {
    // First bounce receiver - specific type bounce
    bounced(msg: bounced<SomeMsg>) {
        // Process specific bounce message
        return;
    }

    // Second bounce receiver - fallback using Slice
    bounced(rawMsg: Slice) {
        // This acts as a fallback for bounced messages
        return;
    }
}
