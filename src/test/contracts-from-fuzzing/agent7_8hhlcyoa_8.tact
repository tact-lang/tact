message MyMessage {
    data: Int as uint64;
}

contract DoubleBounce {
    // First bounced receiver for typed bounced messages
    bounced(msg: bounced<MyMessage>) {
        // process typed bounce
    }

    // Fallback bounced receiver for raw Slice messages
    bounced(raw: Slice) {
        // process raw bounce
    }
}
