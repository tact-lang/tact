message MyMsg {
    value: Int;
}

contract TwoBounce {
    // First bounced receiver for typed bounced messages
    bounced(msg: bounced<MyMsg>) {
        // Process typed bounced message
    }

    // Second bounced receiver for raw Slice messages
    bounced(raw: Slice) {
        // Process raw bounced message
    }

    receive() {
        // Minimal receive function
    }
}
