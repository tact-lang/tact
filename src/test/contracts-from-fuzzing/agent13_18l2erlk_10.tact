message MessageA { data: Int; }
message MessageB { flag: Bool; }

contract MultipleTypedBounceReceiver {
    // Bounce receiver for MessageA
    bounced(msg: bounced<MessageA>) {
        // Process MessageA bounce
    }

    // Bounce receiver for MessageB
    bounced(msg: bounced<MessageB>) {
        // Process MessageB bounce
    }

    // Also allow a raw slice bounce receiver at the end if needed
    bounced(raw: Slice) {
        // Fallback bounce receiver for any other bounced messages
    }
}
