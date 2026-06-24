message MyMsg {
    value: Int;
}

contract DualBounce {
    // This bounced receiver matches bounced messages of type MyMsg
    bounced(msg: bounced<MyMsg>) {
        // Handle typed bounced messages
    }

    // Fallback bounced receiver that catches any bounced messages
    bounced(raw: Slice) {
        // Handle raw bounced messages
    }
}
